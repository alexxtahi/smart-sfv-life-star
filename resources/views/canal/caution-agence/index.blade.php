@extends('layouts.app')
@section('content')
@if(Auth::user()->role == 'Concepteur' or Auth::user()->role == 'Administrateur' or Auth::user()->role == 'Gerant')
<script src="{{asset('assets/js/jquery.validate.min.js')}}"></script>
<script src="{{asset('assets/js/bootstrap-table.min.js')}}"></script>
<script src="{{asset('assets/js/underscore-min.js')}}"></script>
<script src="{{asset('assets/plugins/bootstrap-table/locale/bootstrap-table-fr-FR.js')}}"></script>
<script src="{{asset('assets/js/fonction_crude.js')}}"></script>
<script src="{{asset('assets/js/jquery.datetimepicker.full.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.number.min.js')}}"></script>
<script src="{{asset('assets/plugins/Bootstrap-form-helpers/js/bootstrap-formhelpers-phone.js')}}"></script>
<script src="{{asset('assets/plugins/datepicker/bootstrap-datepicker.js')}}"></script>
<link href="{{asset('assets/css/bootstrap-table.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/jquery.datetimepicker.min.css')}}" rel="stylesheet">
<div class="col-md-3">
    <div class="form-group">
       <input type="text" class="form-control" id="dateDebut" placeholder="Date du début">
    </div>
</div>
<div class="col-md-3">
    <div class="form-group">
       <input type="text" class="form-control" id="dateFin" placeholder="Date de fin">
    </div>
</div>
<div class="col-md-4">
    <select class="form-control" id="searchByAgence">
        <option value="0">-- Toutes les agences --</option>
        @foreach($agences as $agence)
        <option value="{{$agence->id}}"> {{$agence->libelle_agence}}</option>
        @endforeach
    </select>
</div>
<div class="col-md-2">
    <a class="btn btn-success pull-left" onclick="imprimePdf()">Imprimer</a><br/>
</div>
<table id="table" class="table table-warning table-striped box box-primary"
               data-pagination="true"
               data-search="false" 
               data-toggle="table"
               data-url="{{url('canal',['action'=>'liste-caution-agences'])}}"
               data-unique-id="id"
               data-show-toggle="false"
               data-show-columns="false">
    <thead>
        <tr>
            <th data-formatter="checkFormatter"><i class="fa fa-check"></i></th>
            <th data-field="date_versements">Date</th>
            <th data-field="agence.libelle_agence">Agence</th>
            <th data-field="agence.numero_identifiant_agence">Code agence</th>
            <th data-field="type_caution.libelle_type_caution">Caution</th>
            <th data-field="montant_depose" data-formatter="montantFormatter">Montant</th>
            <th data-field="deposant">D&eacute;posant</th>
            <th data-field="reference_versement">Ref. versement</th>
            <th data-field="confirmer" data-formatter="confirmerFormatter">Confirmer</th>
            <th data-field="moyen_reglement.libelle_moyen_reglement">Moyen payement</th>
            <th data-field="recu_versement" data-align="center" data-formatter="imageFormatter">Re&ccedil;u de d&eacute;p&ocirc;t</th>
            <th data-field="id" data-formatter="optionFormatter" data-width="100px" data-align="center"><i class="fa fa-wrench"></i></th>
        </tr>
    </thead>
</table>

<!-- Modal ajout et modification -->
<div class="modal fade bs-modal-ajout" role="dialog" data-backdrop="static">
    <div class="modal-dialog" style="width: 70%">
        <form id="formAjout" ng-controller="formAjoutCtrl" action="#">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <span style="font-size: 16px;">
                        <i class="fa fa-chrome fa-2x"></i>
                        Gestion des cautions des agences
                    </span>
                </div>
                <div class="modal-body">
                    <input type="text" class="hidden" id="idCautionAgenceModifier" name="idCautionAgence" ng-hide="true" ng-model="cautionAgence.id"/>
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Agence *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-institution"></i>
                                    </div>
                                    <select name="agence_id" id="agence_id" class="form-control" required>
                                        <option value="">-- Sectionner l'agence --</option>
                                        @foreach($agences as $agence)
                                        <option value="{{$agence->id}}"> {{$agence->libelle_agence}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Type de caution *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-list"></i>
                                    </div>
                                   <select name="type_caution_id" id="type_caution_id" ng-model="cautionAgence.type_caution_id" class="form-control" required>
                                        <option value="">-- Sectionner le type de caution --</option>
                                        @foreach($type_cautions as $caution)
                                        <option value="{{$caution->id}}"> {{$caution->libelle_type_caution}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Montant *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-money"></i>
                                    </div>
                                    <input type="text" pattern="[0-9]*" class="form-control" ng-model="cautionAgence.montant_depose" id="montant_depose" name="montant_depose" placeholder="Montant versé pour la caution" required>                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>D&eacute;posant *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" onkeyup="this.value = this.value.charAt(0).toUpperCase() + this.value.substr(1);" class="form-control" ng-model="cautionAgence.deposant" id="deposant" name="deposant" placeholder="Nom complet du déposant" required>                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Date du versement *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control" ng-model="cautionAgence.date_versements" id="date_versement" name="date_versement" value="<?=date('d-m-Y');?>" required>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>R&eacute;f&eacute;rence du versement *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-edit"></i>
                                    </div>
                                    <input type="text" class="form-control" ng-model="cautionAgence.reference_versement" id="reference_versement" name="reference_versement" placeholder="Référence du versement" required>                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                             <div class="form-group">
                                <label>Moyen de payement *</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-list"></i>
                                    </div>
                                   <select name="moyen_reglement_id" id="moyen_reglement_id" ng-model="cautionAgence.moyen_reglement_id" class="form-control" required>
                                        <option value="">-- Sectionner le moyen de payement --</option>
                                        @foreach($moyen_reglements as $moyen_reglement)
                                        <option value="{{$moyen_reglement->id}}"> {{$moyen_reglement->libelle_moyen_reglement}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Re&ccedil;u</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-photo"></i>
                                    </div>
                                    <input type="file" class="form-control" name="recu_versement">                                
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <h5 class="text-bold text-blue">
                                <label><br/>
                                    <input type="checkbox" name="confirmer" ng-model="cautionAgence.confirmer" ng-checked="cautionAgence.confirmer">&nbsp; Confirmer
                                </label>
                            </h5>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><span class="overlay loader-overlay"> <i class="fa fa-refresh fa-spin"></i> </span>Valider</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Modal suppresion -->
<div class="modal fade bs-modal-suppression" category="dialog" data-backdrop="static">
    <div class="modal-dialog ">
        <form id="formSupprimer" ng-controller="formSupprimerCtrl" action="#">
            <div class="modal-content">
                <div class="modal-header bg-red">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        Confimation de la suppression
                </div>
                @csrf
                <div class="modal-body ">
                    <input type="text" class="hidden" id="idCautionAgenceSupprimer"  ng-model="cautionAgence.id"/>
                    <div class="clearfix">
                        <div class="text-center question"><i class="fa fa-question-circle fa-2x"></i> Etes vous certains de vouloir supprimer la caution vers&eacute;e par l'agence <br/><b>@{{cautionAgence.agence.libelle_agence + ' le ' + cautionAgence.date_versements}}</b></div>
                        <div class="text-center vertical processing">Suppression en cours</div>
                        <div class="pull-right">
                            <button type="button" data-dismiss="modal" class="btn btn-default btn-sm">Non</button>
                            <button type="submit" class="btn btn-danger btn-sm ">Oui</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Modal confirmation -->
<div class="modal fade bs-modal-confirme" category="dialog" data-backdrop="static">
    <div class="modal-dialog ">
        <form id="formConfirme" ng-controller="formConfirmeCtrl" action="#">
            <div class="modal-content">
                <div class="modal-header bg-green">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    Confimation du payement
                </div>
                @csrf
                <div class="modal-body ">
                    <input type="text" class="hidden" id="idCautionAgenceConfirme"  ng-model="cautionAgence.id"/>
                    <div class="clearfix">
                        <div class="text-center question"><i class="fa fa-question-circle fa-2x"></i> Etes vous certains de vouloir confirmer ce versement <br/><b>Ref : @{{cautionAgence.reference_versement}}</b></div>
                        <div class="text-center vertical processing">Confirmation en cours</div>
                        <div class="pull-right">
                            <button type="button" data-dismiss="modal" class="btn btn-default btn-sm">Non</button>
                            <button type="submit" class="btn btn-success btn-sm ">Oui</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    var ajout = true;
    var $table = jQuery("#table"), rows = [];
    
    appSmarty.controller('formAjoutCtrl', function ($scope) { 
        $scope.populateForm = function (cautionAgence) {
            $scope.cautionAgence = cautionAgence;
        };
        $scope.initForm = function () {
            ajout = true;
            $scope.cautionAgence = {};
        };
    });

    appSmarty.controller('formSupprimerCtrl', function ($scope) {
        $scope.populateForm = function (cautionAgence) {
            $scope.cautionAgence = cautionAgence;
        };
        $scope.initForm = function () {
            $scope.cautionAgence = {};
        };
    });
    
    appSmarty.controller('formConfirmeCtrl', function ($scope) {
        $scope.populateFormConfirme = function (cautionAgence) {
            $scope.cautionAgence = cautionAgence;
        };
        $scope.initForm = function () {
            $scope.cautionAgence = {};
        };
    });
    
    $(function () {
        $table.on('load-success.bs.table', function (e, data) {
            rows = data.rows; 
        });
        $("#searchByAgence, #agence_id").select2({width: '100%', allowClear: true});
        
        $('#dateDebut, #dateFin, #date_versement').datetimepicker({
            timepicker: false,
            formatDate: 'd-m-Y',
            format: 'd-m-Y',
            local : 'fr',
            maxDate : new Date()
        }); 
        
        $("#searchByAgence").change(function (e) {
            var agence = $("#searchByAgence").val();
            var dateDebut = $("#dateDebut").val();
            var dateFin = $("#dateFin").val();
            if(agence == 0 && dateDebut=="" && dateFin==""){
               $table.bootstrapTable('refreshOptions', {url: "{{url('canal', ['action' => 'liste-caution-agences'])}}"});
            }
            if(agence == 0 && dateDebut!="" && dateFin!=""){
              $table.bootstrapTable('refreshOptions', {url: '../canal/liste-caution-agence-by-periode/' + dateDebut + '/' + dateFin});
            }
            if(agence != 0 && dateDebut=="" && dateFin==""){
              $table.bootstrapTable('refreshOptions', {url: '../canal/liste-caution-agence-by-agence/' + agence});
            }
            if(agence != 0 && dateDebut!="" && dateFin!=""){
              $table.bootstrapTable('refreshOptions', {url: '../canal/liste-caution-agence-by-agence-periode/' + agence + '/' + dateDebut + '/' + dateFin});
            }
        });
        $("#dateDebut, #dateFin").change(function (e) {
            $('#agence_id').select2("val", 0)
            var dateDebut = $("#dateDebut").val();
            var dateFin = $("#dateFin").val();
            if(dateDebut=="" && dateFin==""){
               $table.bootstrapTable('refreshOptions', {url: "{{url('canal', ['action' => 'liste-caution-agences'])}}"});
            }else{
               $table.bootstrapTable('refreshOptions', {url: '../canal/liste-caution-agence-by-periode/' + dateDebut + '/' + dateFin});
            }
        });
        
        $("#btnModalAjout").on("click", function () {
            $("#agence_id").val('').trigger('change');
        });

        $("#formAjout").submit(function (e) {
            e.preventDefault();
            var $valid = $(this).valid();
            if (!$valid) {
                $validator.focusInvalid();
                return false;
            }
            var $ajaxLoader = $("#formAjout .loader-overlay");

             if (ajout==true) {
                var methode = 'POST';
                var url = "{{route('canal.caution-agences.store')}}";
             }else{
                var methode = 'POST';
                var url = "{{route('canal.update-caution-agnece')}}";
             }
             var formData = new FormData($(this)[0]);
            editerCautionAgenceAction(methode, url, $(this), formData, $ajaxLoader, $table, ajout);
        });
        
        $("#formSupprimer").submit(function (e) {
            e.preventDefault();
            var id = $("#idCautionAgenceSupprimer").val();
            var $question = $("#formSupprimer .question");
            var $ajaxLoader = $("#formSupprimer .processing");
            supprimerAction('caution-agences/' + id, $(this).serialize(), $question, $ajaxLoader, $table);
        });
        
        $("#formConfirme").submit(function (e) {
            e.preventDefault();
            var id = $("#idCautionAgenceConfirme").val();
            var $question = $("#formConfirme .question");
            var $ajaxLoader = $("#formConfirme .processing");
            confirmeAction('caution-agences-confirme/' + id, $(this).serialize(), $question, $ajaxLoader, $table);
        });
    });
    
    function updateRow(idCautionAgence) {
        ajout= false;
        var $scope = angular.element($("#formAjout")).scope();
        var cautionAgence =_.findWhere(rows, {id: idCautionAgence});
         $scope.$apply(function () {
            $scope.populateForm(cautionAgence);
        });
        $('#agence_id').select2("val", cautionAgence.agence_id)
        $(".bs-modal-ajout").modal("show");
    }
  
    function deleteRow(idCautionAgence) {
          var $scope = angular.element($("#formSupprimer")).scope();
          var cautionAgence =_.findWhere(rows, {id: idCautionAgence});
           $scope.$apply(function () {
              $scope.populateForm(cautionAgence);
          });
       $(".bs-modal-suppression").modal("show");
    }
    
    function confirmeRow(idCautionAgence){
        var $scope = angular.element($("#formConfirme")).scope();
        var cautionAgence =_.findWhere(rows, {id: idCautionAgence});
        $scope.$apply(function () {
            $scope.populateFormConfirme(cautionAgence);
        });
       $(".bs-modal-confirme").modal("show");
    }

    function imageFormatter(image) { 
          return image ? "<a target='_blank' href='" + basePath + '/' + image + "'>Voir le reçu</a>" : "";
    }
    function montantFormatter(montant){
        return montant ? '<span class="text-bold">' + $.number(montant)+ '</span>' : "--";
    }
    function confirmerFormatter(reponse){
        return reponse ? "<span class='text-bold text-green'>OUI</span>" : "<span class='text-bold text-red'>NON</span>"
    }
    function optionFormatter(id, row) {
        return '<button class="btn btn-xs btn-primary" data-placement="left" data-toggle="tooltip" title="Modifier" onClick="javascript:updateRow(' + id + ');"><i class="fa fa-edit"></i></button>\n\
                <button class="btn btn-xs btn-danger" data-placement="left" data-toggle="tooltip" title="Supprimer" onClick="javascript:deleteRow(' + id + ');"><i class="fa fa-trash"></i></button>';
    }
    
    function checkFormatter(id, row){
        if(row.confirmer){
            return "---"
        }else{
            return '<button class="btn btn-xs btn-success" data-placement="left" data-toggle="tooltip" title="Confirmer" onClick="javascript:confirmeRow(' + row.id + ');"><i class="fa fa-check"></i></button>';
        }
    }
    
    function imprimePdf(){
        var agence = $("#searchByAgence").val();
        var dateDebut = $("#dateDebut").val();
        var dateFin = $("#dateFin").val();
        if(agence == 0 && dateDebut=="" && dateFin==""){
            window.open("liste-caution-agence-pdf/" ,'_blank');
        }
        if(agence != 0 && dateDebut=="" && dateFin==""){
            window.open("liste-caution-agence-by-agence-pdf/" + agence,'_blank');  
        }
        if(agence == 0 && dateDebut!="" && dateFin!=""){
            window.open("liste-caution-agence-by-periode-pdf/" +dateDebut+"/"+ dateFin,'_blank');  
        }
        if(agence != 0 && dateDebut!="" && dateFin!=""){
            window.open("liste-caution-agence-by-agenec-periode-pdf/"+agence+"/" +dateDebut+"/"+ dateFin,'_blank');  
        }
    }
    
    function editerCautionAgenceAction(methode, url, $formObject, formData, $ajoutLoader, $table, ajout = true) {
    jQuery.ajax({
        type: methode,
        url: url,
        cache: false,
        data: formData,
        contentType: false,
        processData: false,
        success:function (reponse, textStatus, xhr){
            if (reponse.code === 1) {
                var $scope = angular.element($formObject).scope();
                $scope.$apply(function () {
                    $scope.initForm();
                });
                if (ajout) { //creation
                    $table.bootstrapTable('refresh');
                } else { //Modification
                    $table.bootstrapTable('updateByUniqueId', {
                        id: reponse.data.id,
                        row: reponse.data
                    });
                    $table.bootstrapTable('refresh');
                    $(".bs-modal-ajout").modal("hide");
                }
                $formObject.trigger('eventAjouter', [reponse.data]);
                $("#agence_id").val('').trigger('change');
            }
            $.gritter.add({
                // heading of the notification
                title: "SMART-SFV",
                // the text inside the notification
                text: reponse.msg,
                sticky: false,
                image: basePath + "/assets/img/gritter/confirm.png",
            });
         },
          error: function (err) {
            var res = eval('('+err.responseText+')');
            var messageErreur = res.message;
            
            $.gritter.add({
                // heading of the notification
                title: "SMART-SFV",
                // the text inside the notification
                text: messageErreur,
                sticky: false,
                image: basePath + "/assets/img/gritter/confirm.png",
            });
            $formObject.removeAttr("disabled");
            $ajoutLoader.hide();
        },
         beforeSend: function () {
            $formObject.attr("disabled", true);
            $ajoutLoader.show();
        },
        complete: function () {
            $ajoutLoader.hide();
        },
    });
    };
    
    //Confirmation
    function confirmeAction(url, formData, $question, $ajaxLoader, $table){
    jQuery.ajax({
        type: "PUT",
        url: url,
        cache: false,
        data: formData,
        success: function (reponse) {
            if (reponse.code === 1) {
               
                $(".bs-modal-confirme").modal("hide");
                $table.bootstrapTable('refresh');
            }
            $.gritter.add({
                // heading of the notification
                title: "SMART-SFV",
                // the text inside the notification
                text: reponse.msg,
                sticky: false,
                image: basePath + "/assets/img/gritter/confirm.png",
            });
        },
        error: function (err) {
            var res = eval('('+err.responseText+')');
            //alert(res.message);
            //alert(Object.getOwnPropertyNames(res));
            $.gritter.add({
                // heading of the notification
                title: "SMART-SFV",
                // the text inside the notification
                text: res.message,
                sticky: false,
                image: basePath + "/assets/img/gritter/confirm.png"
            });
            $ajaxLoader.hide();
            $question.show();
        },
        beforeSend: function () {
            $question.hide();
            $ajaxLoader.show();
        },
        complete: function () {
            $ajaxLoader.hide();
            $question.show();
        }
        });
    }
    
</script>
@else
@include('layouts.partials.look_page')
@endif
@endsection


