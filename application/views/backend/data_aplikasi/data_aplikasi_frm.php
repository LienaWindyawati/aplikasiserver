<!-- //Subscribe Youtube Channel Peternak Kode on https://youtube.com/c/peternakkode -->
<!doctype html>
<div class="ibox float-e-margins" ng-show="f.tab=='list'">
    <div class="ibox-title">
        <div class="pull-right form-inline">
            <button type="button" class="btn btn-sm btn-primary" ng-click="new()">Buat Baru</button>
        </div>
        <h3>Daftar Data_aplikasi</h3>
    </div>
    <div class="ibox-content form-inline">
        <div class="input-group m-b">
            <input type="text" ng-model="f.q" class="form-control input-sm" placeholder="" ng-enter ="getList()">
            <span class="input-group-addon pointer" ng-click="getList()">Cari</span>
        </div>
        <div id="div1" class="table-responsive">
            <table ng-table="tableList" show-filter="false" class="table table-condensed table-bordered table-hover" style="white-space: nowrap;">
                <tr ng-repeat="(k,v) in $data" class="pointer" ng-click="read(v.id_aplikasi)">
                    <td title="'No'">{{k+1}}</td>
                    <td title="'Nama'" filter="{nama: 'text'}" sortable="'nama'">{{v.nama}}</td>
                    <td title="'Url'" filter="{url: 'text'}" sortable="'url'">{{v.url}}</td>
                    <td title="'Pemilik'" filter="{pemilik: 'text'}" sortable="'pemilik'">{{v.pemilik}}</td>
                    <td title="'Tahun Buat'" filter="{tahun_buat: 'text'}" sortable="'tahun_buat'">{{v.tahun_buat}}</td>
                    <td title="'Deskripsi'" filter="{deskripsi: 'text'}" sortable="'deskripsi'">{{v.deskripsi}}</td>
                    <td title="'Intergrasi'" filter="{intergrasi: 'text'}" sortable="'intergrasi'">{{v.intergrasi}}</td>
                    <td title="'Status Optimal'" filter="{status_optimal: 'text'}" sortable="'status_optimal'">{{v.status_optimal}}</td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="ibox float-e-margins" ng-show="f.tab=='frm'">
    <div class="ibox-title">
        <div class="pull-right form-inline">
            <button type="button" class="btn btn-sm btn-info" ng-click="f.tab='list'"><i class="fa fa-arrow-left"></i> Kembali</button>
            <button type="button" class="btn btn-sm btn-primary" ng-click="save()">Simpan</button>
            <button type="button" class="btn btn-sm btn-warning" ng-click="copy()" ng-if="f.crud=='u'">Duplikasi</button>
            <button type="button" class="btn btn-sm btn-warning" ng-click="prin()" ng-if="f.crud=='u'">Cetak</button>
            <button type="button" class="btn btn-sm btn-danger" ng-click="del()" ng-if="f.crud=='u'">Hapus</button>
        </div>
        <h3>Form Data_aplikasi</h3>
    </div>
    <div class="ibox-content frmEntry">
        <div class="row">
            <div class="col-sm-4">
                <label title="nama">Nama</label>
                <input type="text" ng-model="h.nama" class="form-control input-sm" >
                <label title="url">Url</label>
                <input type="text" ng-model="h.url" class="form-control input-sm" >
                <label title="pemilik">Pemilik</label>
                <input type="text" ng-model="h.pemilik" class="form-control input-sm" >
                <label title="tahun_buat">Tahun Buat</label>
                <input type="text" ng-model="h.tahun_buat" class="form-control input-sm date" >
                <label title="deskripsi">Deskripsi</label>
                <input type="text" ng-model="h.deskripsi" class="form-control input-sm" >
                <label title="intergrasi">Intergrasi</label>
                <input type="text" ng-model="h.intergrasi" class="form-control input-sm" >
                <label title="status_optimal">Status Optimal</label>
                <select ng-model="h.status_optimal" class="form-control input-sm">
                    <option ng-repeat="v in [['YES','YES'],['NO','NO']]" ng-value="v[0]">{{v[1]}}</option>
                </select>
            </div>
        </div>
    </div>
</div>
<script>
app.controller('mainCtrl', ['$scope', '$http', 'NgTableParams', 'SfService', 'FileUploader', function($scope, $http, NgTableParams, SfService, FileUploader) {
    SfService.setUrl("<?=base_url()?>data_aplikasi");
    $scope.f = { crud: 'c', tab: 'list', pk: 'id_aplikasi' };
    $scope.h = {};

    $scope.new = function() {
        $scope.f.tab = 'frm';
        $scope.f.crud = 'c';
        $scope.h = {tanggal:moment().format('YYYY/MM/DD')};
    }

    $scope.copy=function(){
        $scope.f.crud='c';
        $scope.h[$scope.f.pk]='';
    }

    $scope.getList = function() {
        $scope.tableList = new NgTableParams({}, {
            getData: function($defer, params) {
                var $btn = $('button').button('loading');
                return $http.get(SfService.getUrl('/getList'), {
                    params: {
                    page: $scope.tableList.page(),
                    limit: $scope.tableList.count(),
                    order_by: $scope.tableList.orderBy(),
                    q: $scope.f.q
                    }
                }).then(function(jdata) {
                    $btn.button('reset');
                    $scope.tableList.total(jdata.data.total);
                    return jdata.data.data;
                }, function(error) {
                    $btn.button('reset');
                    swal('', error.data, 'error');
                });

            }
        });
    }

    $scope.save = function() {
        if (SfFormValidate('.frmEntry') == false) {
            swal('', 'Data not valid', 'error');
            return false;
        }

        SfService.post(SfService.getUrl('/save'), { f: $scope.f, h: $scope.h,fld_stat:""}, function(jdata) {
            console.log(jdata);
            $scope.f.tab = 'list';
            $scope.getList();
        });
    }

    $scope.read = function(id) {
        SfService.get(SfService.getUrl("/read/" + id), {}, function(jdata) {
            $scope.f.tab = 'frm';
            $scope.f.crud = 'u';
            $scope.h = jdata.data.h;
        });
    }

    $scope.del = function(id) {
        if (id == undefined) {
            var id = $scope.h[$scope.f.pk];
        }

        swal({
                title: "Perhatian",
                text: "Hapus data ini? id=" + id,
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Ya, Hapus!",
                closeOnConfirm: false
            },
            function() {
                SfService.get(SfService.getUrl("/delete/" + id), {}, function(jdata) {
                    $scope.f.tab = 'list';
                    $scope.getList();
                    swal("Berhasil!", "Data berhasil dihapus.", "success");
                });
            });
    }

    $scope.prin = function(id) {
        if (id == undefined) {
            var id = $scope.h[$scope.f.pk];
        }
        window.open(SfService.getUrl('/prin') + "?id=" + encodeURI(id), 'print_' + id, 'width=950,toolbar=0,resizable=0,scrollbars=yes,height=520,top=100,left=100').focus();
    }

    $scope.lookup = function(icase, fn) {
        switch (icase) {
            // case 'id_mustahik':
            //     SfLookup("<?=base_url()?>master_mustahik/lookup", function(id,name,json) {
            //         $scope.h.id_mustahik=id;
            //         $scope.h.nm_mustahik=name;
            //         $scope.$apply();
            //     });
            //     break;
            default:
                swal('Pilihan tidak tersedia');
                break;
        }
    }

    $scope.getList();

}]);
</script>