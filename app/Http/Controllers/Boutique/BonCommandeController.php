<?php

namespace App\Http\Controllers\Boutique;

use App\Http\Controllers\Controller;
use App\Models\Boutique\ArticleBon;
use App\Models\Boutique\BonCommande;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
include_once(app_path ()."/number-to-letters/nombre_en_lettre.php");

class BonCommandeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
       $fournisseurs = DB::table('fournisseurs')->Where('deleted_at', NULL)->orderBy('full_name_fournisseur', 'asc')->get();
       $articles = DB::table('articles')->Where('deleted_at', NULL)->orderBy('description_article', 'asc')->get();
       $menuPrincipal = "Boutique";
       $titleControlleur = "Bon de commande";
       $btnModalAjout = "TRUE";
       return view('boutique.bon-commande.index',compact('fournisseurs','articles', 'menuPrincipal', 'titleControlleur', 'btnModalAjout'));
    }
    
    public function vuReceptionCommande(){
       $fournisseurs = DB::table('fournisseurs')->Where('deleted_at', NULL)->orderBy('full_name_fournisseur', 'asc')->get();
       $menuPrincipal = "Boutique";
       $titleControlleur = "Réception de commande";
       $btnModalAjout = "FALSE";
       return view('boutique.bon-commande.reception-commande',compact('fournisseurs','menuPrincipal', 'titleControlleur', 'btnModalAjout'));
 
    }

    public function listeBonCommande()
    {
     $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*',DB::raw('sum(article_bons.quantite_demande*article_bons.prix_article) as montantBon'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where('bon_commandes.deleted_at', NULL)
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function listeBonCommandeByNumeroBon($numero_bon){
        $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*',DB::raw('sum(article_bons.quantite_demande*article_bons.prix_article) as montantBon'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.numero_bon','like','%'.$numero_bon.'%']])
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function listeBonCommandeByDate($dates){
        $date = Carbon::createFromFormat('d-m-Y', $dates);
        $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*',DB::raw('sum(article_bons.quantite_demande*article_bons.prix_article) as montantBon'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where('bon_commandes.deleted_at', NULL)
                ->whereDate('bon_commandes.date_bon_commande','=', $date)
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function listeBonCommandeByFournisseur($fournisseur){
         $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*',DB::raw('sum(article_bons.quantite_demande*article_bons.prix_article) as montantBon'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.fournisseur_id',$fournisseur]])
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function listeReceptionCommande()
    {
     $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*','bon_commandes.id as commmande_id',DB::raw('sum(article_bons.quantite_recu*article_bons.prix_article) as montantCommande'),DB::raw('DATE_FORMAT(bon_commandes.date_reception_commande, "%d-%m-%Y") as date_reception_commandes'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where('bon_commandes.deleted_at', NULL)
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function listeReceptionCommandeByNumeroBon($numero_bon){
        $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*','bon_commandes.id as commmande_id',DB::raw('sum(article_bons.quantite_recu*article_bons.prix_article) as montantCommande'),DB::raw('DATE_FORMAT(bon_commandes.date_reception_commande, "%d-%m-%Y") as date_reception_commandes'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.numero_bon','like','%'.$numero_bon.'%']])
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function listeReceptionCommandeByByDate($dates){
        $date = Carbon::createFromFormat('d-m-Y', $dates);
        $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*','bon_commandes.id as commmande_id',DB::raw('sum(article_bons.quantite_recu*article_bons.prix_article) as montantCommande'),DB::raw('DATE_FORMAT(bon_commandes.date_reception_commande, "%d-%m-%Y") as date_reception_commandes'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where('bon_commandes.deleted_at', NULL)
                ->whereDate('bon_commandes.date_reception_commande','=', $date)
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    public function listeReceptionCommandeByFournisseur($fournisseur){
        $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*','bon_commandes.id as commmande_id',DB::raw('sum(article_bons.quantite_recu*article_bons.prix_article) as montantCommande'),DB::raw('DATE_FORMAT(bon_commandes.date_reception_commande, "%d-%m-%Y") as date_reception_commandes'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.fournisseur_id',$fournisseur]])
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }
    
    public function findReceptionCommandeById($id){
        $bon_commandes =  BonCommande::with('fournisseur')
                ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                ->select('bon_commandes.*','bon_commandes.id as commmande_id',DB::raw('sum(article_bons.quantite_recu*article_bons.prix_article) as montantCommande'),DB::raw('DATE_FORMAT(bon_commandes.date_reception_commande, "%d-%m-%Y") as date_reception_commandes'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.id', $id]])
                ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                ->groupBy('bon_commandes.id')
                ->get();
        $jsonData["rows"] = $bon_commandes->toArray();
        $jsonData["total"] = $bon_commandes->count();
        return response()->json($jsonData);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $jsonData = ["code" => 1, "msg" => "Enregistrement effectué avec succès."];
        if ($request->isMethod('post') && $request->input('date_bon_commande')) {

                $data = $request->all(); 

            try {
                if(empty($data['articles'])){
                    return response()->json(["code" => 0, "msg" => "Vous n'avez pas ajouté d'articles à ce bon de commande", "data" => NULL]);
                }
                //formation numéro de bon
                $maxId = DB::table('bon_commandes')->max('id');
                $numero_bon = sprintf("%06d", ($maxId + 1));
                $bonCommande = new BonCommande;
                $bonCommande->numero_bon = $numero_bon;
                $bonCommande->fournisseur_id = $data['fournisseur_id'];
                $bonCommande->date_bon_commande = Carbon::createFromFormat('d-m-Y', $data['date_bon_commande']);
                $bonCommande->created_by = Auth::user()->id;
                $bonCommande->save();
                
                if($bonCommande && !empty($data["articles"])){
                    //enregistrement des articles de l'approvisionnement
                    $articles = $data["articles"];
                    $quantites = $data["quantites"];
                    $prix_achats = $data["prix_achats"];
                    
                    foreach($articles as $index => $article) {
                        //Augmentation stock dans depot-article
                        $ArticleBon = ArticleBon::where([['article_id', $article],['bon_commande_id', $bonCommande->id]])->first();
                        if($ArticleBon!=null){
                            $ArticleBon->quantite = $ArticleBon->quantite + $quantites[$index];
                            $ArticleBon->save();
                        }else{
                            $articleBon = new ArticleBon;
                            $articleBon->article_id = $article;
                            $articleBon->bon_commande_id = $bonCommande->id;
                            $articleBon->quantite_demande = $quantites[$index];
                            $articleBon->prix_article = $prix_achats[$index];
                            $articleBon->save();
                        }
                    }
                }
                $jsonData["data"] = json_decode($bonCommande);
                return response()->json($jsonData);

            } catch (Exception $exc) {
               $jsonData["code"] = -1;
               $jsonData["data"] = NULL;
               $jsonData["msg"] = $exc->getMessage();
               return response()->json($jsonData); 
            }
        }
        return response()->json(["code" => 0, "msg" => "Saisie invalide", "data" => NULL]);
    }
    

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  \App\BonCommande  $bonCommande
     * @return Response
     */
    public function update(Request $request, BonCommande $bonCommande)
    {
       $jsonData = ["code" => 1, "msg" => "Modification effectuée avec succès."];
       
        if($bonCommande){
            $data = $request->all(); 
            try {
               
                $bonCommande->fournisseur_id = $data['fournisseur_id'];
                $bonCommande->date_bon_commande = Carbon::createFromFormat('d-m-Y', $data['date_bon_commande']);
                $bonCommande->updated_by = Auth::user()->id;
                $bonCommande->save();
                $jsonData["data"] = json_decode($bonCommande);
            return response()->json($jsonData);

            } catch (Exception $exc) {
               $jsonData["code"] = -1;
               $jsonData["data"] = NULL;
               $jsonData["msg"] = $exc->getMessage();
               return response()->json($jsonData); 
            }

        }
        return response()->json(["code" => 0, "msg" => "Echec de modification", "data" => NULL]); 
    }
    
    public function editerCommande(Request $request){
        $jsonData = ["code" => 1, "msg" => "Enregistrement effectué avec succès."];
        if ($request->isMethod('post') && $request->input('date_reception_commande')) {

                $data = $request->all(); 

            try {
                $bonCommande = BonCommande::find($data["idBonCommande"]);
                $bonCommande->date_reception_commande = Carbon::createFromFormat('d-m-Y', $data['date_reception_commande']);
                $bonCommande->livrer = isset($data["livrer"]) && !empty($data["livrer"]) ? TRUE:FALSE;
                //Ajout du scanne de la facture du fournisseur
                if(isset($data['scan_facture_commande']) && !empty($data['scan_facture_commande'])){
                    $scan_facture_commande = request()->file('scan_facture_commande');
                    $file_name = str_replace(' ', '_', strtolower(time().'.'.$scan_facture_commande->getClientOriginalName()));
                    $path = public_path().'/documents/facture/';
                    $scan_facture_commande->move($path,$file_name);
                    $bonCommande->scan_facture_commande = 'documents/facture/'.$file_name;
                }
                $bonCommande->updated_by = Auth::user()->id;
                $bonCommande->save();
                
                if(!empty($data["articles"])){
                    //enregistrement des articles de l'approvisionnement
                    $articles = $data["articles"];
                    $quantite_demandes = $data["quantite_demandes"];
                    $quantite_recus = $data["quantite_recus"];
                    
                    foreach($articles as $index => $article) {
                        //Augmentation stock dans depot-article
                        $ArticleBon = ArticleBon::where([['article_id', $article],['bon_commande_id', $bonCommande->id]])->first();
                        if($ArticleBon!=null){
                            $ArticleBon->article_id = $article;
                            $ArticleBon->bon_commande_id = $bonCommande->id;
                            $ArticleBon->quantite_demande = $quantite_demandes[$index];
                            $ArticleBon->quantite_recu = $quantite_recus[$index];
                            $ArticleBon->save();
                        }
                    }
                }
                $jsonData["data"] = json_decode($bonCommande);
                return response()->json($jsonData);

            } catch (Exception $exc) {
               $jsonData["code"] = -1;
               $jsonData["data"] = NULL;
               $jsonData["msg"] = $exc->getMessage();
               return response()->json($jsonData); 
            }
        }
        return response()->json(["code" => 0, "msg" => "Saisie invalide", "data" => NULL]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\BonCommande  $bonCommande
     * @return Response
     */
    public function destroy(BonCommande $bonCommande)
    {
         $jsonData = ["code" => 1, "msg" => " Opération effectuée avec succès."];
            if($bonCommande){
                try {
                $bonCommande->update(['deleted_by' => Auth::user()->id]);
                $bonCommande->delete();
                $jsonData["data"] = json_decode($bonCommande);
                return response()->json($jsonData);
                } catch (Exception $exc) {
                   $jsonData["code"] = -1;
                   $jsonData["data"] = NULL;
                   $jsonData["msg"] = $exc->getMessage();
                   return response()->json($jsonData); 
                }
            }
        return response()->json(["code" => 0, "msg" => "Echec de suppression", "data" => NULL]);
    }
    
    //Fonction pour recuperer les infos de Helpers
    public function infosConfig(){
        $get_configuration_infos = \App\Helpers\ConfigurationHelper\Configuration::get_configuration_infos(1);
        return $get_configuration_infos;
    }
    
    //Etat fiche de bon
    public function ficheBonCommandePdf($bon_commande_id){
        $pdf = \App::make('dompdf.wrapper');
        $pdf->getDomPDF()->set_option("enable_php", true);
        $pdf->loadHTML($this->ficheBonCommande($bon_commande_id));
        $bon = BonCommande::find($bon_commande_id);
        return $pdf->stream('Bon_de_commande_numero_'.$bon->numero_bon.'.pdf');
    }
    
    public function ficheBonCommande($bon_commande_id){
        $outPut = $this->header($bon_commande_id);
        $outPut.= $this->bonCommandecontent($bon_commande_id);
        $outPut.= $this->footer();
        return $outPut;
    }
    
    //Etat fiche reception
    public function ficheReceptionBonCommandePdf($commande_id){
        $pdf = \App::make('dompdf.wrapper');
        $pdf->getDomPDF()->set_option("enable_php", true);
        $pdf->loadHTML($this->ficheReceptionBonCommande($commande_id));
        $bon = BonCommande::find($commande_id);
        return $pdf->stream('Commande_numero_'.$bon->numero_bon.'.pdf');
    }
    public function ficheReceptionBonCommande($commande_id){
        $outPut = $this->headerReceptionCommande($commande_id);
        $outPut.= $this->contentReceptionCommande($commande_id);
        $outPut.= $this->footer();
        return $outPut;
    }

    //Reception de commande
    public function contentReceptionCommande($commande_id){
        
         $elements = ArticleBon::with('article')
                    ->select('article_bons.*')
                    ->Where([['article_bons.deleted_at', NULL],['article_bons.bon_commande_id',$commande_id]])
                    ->get();
        
        $content = '<div class="container-table">
                        <table border="1" cellspacing="-1" width="100%">
                            <tr>
                                <th cellspacing="0" border="2" width="55%" align="center">Article</th>
                                <th cellspacing="0" border="2" width="10%" align="center">Qté deman.</th>
                                <th cellspacing="0" border="2" width="10%" align="center">Qté reçu.</th>
                                <th cellspacing="0" border="2" width="20%" align="center">Prix Achat TTC</th>
                                <th cellspacing="0" border="2" width="20%" align="center">Montant TTC</th>
                            </tr>';
         $totalElement = 0;
        foreach($elements as $element){
            
            $totalElement = $totalElement + $element->prix_article*$element->quantite_recu;
     
            $content.='<tr>
                            <td style="font-size:13px;"  cellspacing="0" border="2" width="55%">&nbsp;&nbsp;&nbsp;'.$element->article->description_article.'</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="center" width="10%">'.$element->quantite_demande.'</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="center" width="10%">'.$element->quantite_recu.'</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="right" width="20%">'.number_format($element->prix_article, 0, ',', ' ').'&nbsp;&nbsp;&nbsp;</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="right" width="20%">'.number_format($element->prix_article*$element->quantite_recu, 0, ',', ' ').'&nbsp;&nbsp;&nbsp;</td>
                       </tr>';
        }
        
        $content.='<tr>
                        <td style="font-size:13px;"  cellspacing="0" colspan="3" border="2" align="left" width="70%"><b>&nbsp;&nbsp;Montant TTC</b></td>
                        <td style="font-size:15px;"  cellspacing="0" colspan="3" border="2" align="right" width="30%">&nbsp;&nbsp;<b>'.number_format($totalElement, 0, ',', ' ').'&nbsp;&nbsp;&nbsp;</b></td>
                    </tr>  
                </table>
                <p style="font-style: italic;"> NET A PAYER <b>'.ucfirst(NumberToLetter(round($totalElement))).' F CFA</b></p>
         </div>';
        
       return $content;
    }
   
    //Content bon de commande
    public function bonCommandecontent($bon_commande_id){
        $elements = ArticleBon::with('article')
                    ->select('article_bons.*')
                    ->Where([['article_bons.deleted_at', NULL],['article_bons.bon_commande_id',$bon_commande_id]])
                    ->get();
        
        $content = '<div class="container-table">
                        <table border="1" cellspacing="-1" width="100%">
                            <tr>
                                <th cellspacing="0" border="2" width="55%" align="center">Article</th>
                                <th cellspacing="0" border="2" width="10%" align="center">Qté</th>
                                <th cellspacing="0" border="2" width="20%" align="center">Prix Achat TTC</th>
                                <th cellspacing="0" border="2" width="20%" align="center">Montant TTC</th>
                            </tr>';
         $totalElement = 0;
        foreach($elements as $element){
            
            $totalElement = $totalElement + $element->prix_article*$element->quantite_demande;
     
            $content.='<tr>
                            <td style="font-size:13px;"  cellspacing="0" border="2" width="55%">&nbsp;&nbsp;&nbsp;'.$element->article->description_article.'</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="center" width="10%">'.$element->quantite_demande.'</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="right" width="20%">'.number_format($element->prix_article, 0, ',', ' ').'&nbsp;&nbsp;&nbsp;</td>
                            <td style="font-size:13px;"  cellspacing="0" border="2" align="right" width="20%">'.number_format($element->prix_article*$element->quantite_demande, 0, ',', ' ').'&nbsp;&nbsp;&nbsp;</td>
                       </tr>';
        }
        
        $content.='<tr>
                        <td style="font-size:13px;"  cellspacing="0" colspan="3" border="2" align="left" width="70%"><b>&nbsp;&nbsp;Montant TTC</b></td>
                        <td style="font-size:15px;"  cellspacing="0" colspan="3" border="2" align="right" width="30%">&nbsp;&nbsp;<b>'.number_format($totalElement, 0, ',', ' ').'&nbsp;&nbsp;&nbsp;</b></td>
                    </tr>  
                </table>
                <p style="font-style: italic;"> NET A PAYER <b>'.ucfirst(NumberToLetter(round($totalElement))).' F CFA</b></p>
         </div>';
        
       return $content;
    }
    
     //Fiche header 
    public function headerReceptionCommande($commande_id){
        $bon = BonCommande::with('fournisseur')
                    ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                    ->select('bon_commandes.*',DB::raw('sum(article_bons.quantite_demande*article_bons.prix_article) as montantBon'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                    ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.id',$commande_id]])
                    ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                    ->groupBy('bon_commandes.id')
                    ->first();
                
        $header = "<html>
                        <head>
                            <meta charset='utf-8'>
                            <title></title>
                                    <style>
                                        .container-table{        
                                            margin:200px 0;
                                            width: 100%;
                                        }
                                        .container{
                                            width: 100%;
                                            margin: 2px 5px;
                                            font-size:15px;
                                        }
                                        .fixed-header-left{
                                            width: 34%;
                                            height:4%;
                                            position: absolute; 
                                            line-height:1;
                                            font-size:13px;
                                            top: 0;
                                        }
                                        .fixed-header-right{
                                            width: 40%;
                                            height:6%;
                                            float: right;
                                            position: absolute;
                                            top: 0;
                                            background: #fff;
                                            padding: 10px 0;
                                            color: #333;
                                            border: 1px #333 solid;
                                            border-radius: 3px;
                                        }
                                        .fixed-header-center{
                                            width:35%;
                                            height:7%;
                                            margin: 0 150px;
                                            top: 0;
                                            text-align:center;
                                            position: absolute; 
                                        }
                                        .fixed-footer{
                                            position: fixed; 
                                            bottom: -28; 
                                            left: 0px; 
                                            right: 0px;
                                            height: 80px; 
                                            text-align:center;
                                        }     
                                        .titre-style{
                                         text-align:center;
                                         text-decoration: underline;
                                        }
                                   footer{
                                    font-size:13px;
                                    position: absolute; 
                                    bottom: -35px; 
                                    left: 0px; 
                                    right: 0px;
                                    height: 80px; 
                                    text-align:center;
                                    }
                                    </style>
                        </head>
                <body style='margin-bottom:0; margin-top:0px;'>
                <div class='fixed-header-left'>
                    <div class='container'>
                         <img src=".$this->infosConfig()->logo." width='200' height='160'/> 
                    </div>
                </div>
                <div class='fixed-header-center'>
                    <div class='container'>
                       Réception de bon N°: <b>".$bon->numero_bon."</b><br/>
                       Date : <b>".$bon->date_bon_commandes."</b><br/>
                    </div>
                </div>
                <div class='fixed-header-right'>
                    <div class='container'>
                       Fournisseur : <b>".$bon->fournisseur->full_name_fournisseur."</b><br/>
                       Contact : <b>".$bon->fournisseur->contact_fournisseur."</b><br/>
                       Adresse : <b>".$bon->fournisseur->adresse_fournisseur."</b>
                    </div>
                </div>";     
        return $header;
    }
    public function header($bon_commande_id){
        $bon = BonCommande::with('fournisseur')
                    ->join('article_bons','article_bons.bon_commande_id','=','bon_commandes.id')
                    ->select('bon_commandes.*',DB::raw('sum(article_bons.quantite_demande*article_bons.prix_article) as montantBon'),DB::raw('DATE_FORMAT(bon_commandes.date_bon_commande, "%d-%m-%Y") as date_bon_commandes'))
                    ->Where([['bon_commandes.deleted_at', NULL],['bon_commandes.id',$bon_commande_id]])
                    ->orderBy('bon_commandes.date_bon_commande', 'DESC')
                    ->groupBy('bon_commandes.id')
                    ->first();
                
        $header = "<html>
                        <head>
                            <meta charset='utf-8'>
                            <title></title>
                                    <style>
                                        .container-table{        
                                            margin:200px 0;
                                            width: 100%;
                                        }
                                        .container{
                                            width: 100%;
                                            margin: 2px 5px;
                                            font-size:15px;
                                        }
                                        .fixed-header-left{
                                            width: 34%;
                                            height:4%;
                                            position: absolute; 
                                            line-height:1;
                                            font-size:13px;
                                            top: 0;
                                        }
                                        .fixed-header-right{
                                            width: 40%;
                                            height:6%;
                                            float: right;
                                            position: absolute;
                                            top: 0;
                                            background: #fff;
                                            padding: 10px 0;
                                            color: #333;
                                            border: 1px #333 solid;
                                            border-radius: 3px;
                                        }
                                        .fixed-header-center{
                                            width:35%;
                                            height:7%;
                                            margin: 0 150px;
                                            top: 0;
                                            text-align:center;
                                            position: absolute; 
                                        }
                                        .fixed-footer{
                                            position: fixed; 
                                            bottom: -28; 
                                            left: 0px; 
                                            right: 0px;
                                            height: 80px; 
                                            text-align:center;
                                        }     
                                        .titre-style{
                                         text-align:center;
                                         text-decoration: underline;
                                        }
                                    footer{
                                    font-size:13px;
                                    position: absolute; 
                                    bottom: -35px; 
                                    left: 0px; 
                                    right: 0px;
                                    height: 80px; 
                                    text-align:center;
                                    }
                                    </style>
                        </head>
                <body style='margin-bottom:0; margin-top:0px;'>
                <div class='fixed-header-left'>
                    <div class='container'>
                         <img src=".$this->infosConfig()->logo." width='200' height='160'/> 
                    </div>
                </div>
                <div class='fixed-header-center'>
                    <div class='container'>
                       Bon N°: <b>".$bon->numero_bon."</b><br/>
                       Date : <b>".$bon->date_bon_commandes."</b><br/>
                    </div>
                </div>
                <div class='fixed-header-right'>
                    <div class='container'>
                       Fournisseur : <b>".$bon->fournisseur->full_name_fournisseur."</b><br/>
                       Contact : <b>".$bon->fournisseur->contact_fournisseur."</b><br/>
                       Adresse : <b>".$bon->fournisseur->adresse_fournisseur."</b>
                    </div>
                </div>";     
        return $header;
    }
    //Footer fiche
    public function footer(){
        $type_compagnie='';$capital='';$rccm='';$ncc='';$adresse_compagnie='';$numero_compte_banque='';$banque='';$nc_tresor='';$email_compagnie='';$cellulaire=''; $telephone_faxe=''; $telephone_fixe='';
        $search  = array('À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ù', 'Ú', 'Û', 'Ü', 'Ý', 'à', 'á', 'â', 'ã', 'ä', 'å', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ð', 'ò', 'ó', 'ô', 'õ', 'ö', 'ù', 'ú', 'û', 'ü', 'ý', 'ÿ');
        $replace = array('A', 'A', 'A', 'A', 'A', 'A', 'C', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'I', 'O', 'O', 'O', 'O', 'O', 'U', 'U', 'U', 'U', 'Y', 'a', 'a', 'a', 'a', 'a', 'a', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'o', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u', 'y', 'y');
        $nom_compagnie = str_replace($search, $replace, $this->infosConfig()->nom_compagnie);
        if($this->infosConfig()->type_compagnie!=null){
            $type_compagnie = $this->infosConfig()->type_compagnie;
        }
        if($this->infosConfig()->capital!=null){
            $capital = ' au capital de '.number_format($this->infosConfig()->capital, 0, ',', ' ').' F CFA';
        }
        if($this->infosConfig()->rccm!=null){
            $rccm = ' RCCM '.$this->infosConfig()->rccm;
        }
        if($this->infosConfig()->ncc!=null){
            $ncc = ' NCC '.$this->infosConfig()->ncc;
        }
        if($this->infosConfig()->adresse_compagnie!=null){
            $adresse_compagnie = ' Siège social: '.$this->infosConfig()->adresse_compagnie;
        }
        if($this->infosConfig()->numero_compte_banque!=null){
            $numero_compte_banque =$this->infosConfig()->numero_compte_banque;
        }
        if($this->infosConfig()->banque!=null){
            $banque = 'N° de compte - '.$this->infosConfig()->banque.': ';
        }
        if($this->infosConfig()->nc_tresor!=null){
            $nc_tresor = ' - TRESOR: '.$this->infosConfig()->nc_tresor;
        }
        if($this->infosConfig()->email_compagnie!=null){
            $email_compagnie = ' Email : '.$this->infosConfig()->email_compagnie;
        }
        if($this->infosConfig()->cellulaire!=null){
            $cellulaire = ' / '.$this->infosConfig()->cellulaire;
        }
        if($this->infosConfig()->telephone_faxe!=null){
            $telephone_faxe = ' Fax : '.$this->infosConfig()->telephone_faxe;
        }
        if($this->infosConfig()->telephone_fixe!=null){
            $telephone_fixe = ' Tel : '.$this->infosConfig()->telephone_fixe;
        }
        $footer ="<footer>
                        <hr width='100%'>
                      <b>".strtoupper($nom_compagnie)."</b><br/>
                      ".strtoupper($type_compagnie)."".$capital."".$rccm."".$ncc."".$adresse_compagnie."
                        ".$banque."".$numero_compte_banque."".$nc_tresor."".$email_compagnie."
                        Cel: ".$this->infosConfig()->contact_responsable."".$cellulaire."".$telephone_fixe."".$telephone_faxe."
               </footer>
            </body>
        </html>";
        return $footer;
    }
}
