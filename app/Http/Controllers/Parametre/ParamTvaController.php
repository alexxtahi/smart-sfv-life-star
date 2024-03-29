<?php

namespace App\Http\Controllers\Parametre;

use App\Http\Controllers\Controller;
use App\Models\Parametre\ParamTva;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ParamTvaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
       $menuPrincipal = "Paramètre";
       $titleControlleur = "Gestion TVA";
       $btnModalAjout = "FALSE";
       return view('parametre.param-tva.index',compact('btnModalAjout', 'menuPrincipal', 'titleControlleur')); 
    }

    public function listeParamTva()
    {
        $param_tvas = DB::table('param_tvas')
                ->select('param_tvas.*',DB::raw('(montant_tva*100) as montant_tva_convertis'))
                ->Where('deleted_at', NULL)
                ->get();
       $jsonData["rows"] = $param_tvas->toArray();
       $jsonData["total"] = $param_tvas->count();
       return response()->json($jsonData);
    }
    
    public function findParamTva($id){
        $param_tva = DB::table('param_tvas')
                ->select('param_tvas.*')
                ->Where([['deleted_at', NULL],['param_tvas.id',$id]])
                ->get();
       $jsonData["rows"] = $param_tva->toArray();
       $jsonData["total"] = $param_tva->count();
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
        if ($request->isMethod('post') && $request->input('montant_tva')) {

                $data = $request->all(); 

            try {

                $request->validate([
                    'montant_tva' => 'required',
                ]);
                $ParamTva = ParamTva::where('montant_tva', $data['montant_tva'])->first();
                if($ParamTva!=null){
                    return response()->json(["code" => 0, "msg" => "Cet enregistrement existe déjà dans la base", "data" => NULL]);
                }

                $paramTva = new ParamTva;
                $paramTva->montant_tva = ($data['montant_tva']/100);
                $paramTva->created_by = Auth::user()->id;
                $paramTva->save();
                $jsonData["data"] = json_decode($paramTva);
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
     * @param  \App\ParamTva  $paramTva
     * @return Response
     */
    public function update(Request $request, ParamTva $paramTva)
    {
        $jsonData = ["code" => 1, "msg" => "Modification effectuée avec succès."];
        
        if($paramTva){
            try {

                $request->validate([
                    'montant_tva' => 'required',
                ]);
                $ParamTva = ParamTva::where('montant_tva', $request->get('montant_tva'))->first();
                if($ParamTva!=null){
                    return response()->json(["code" => 0, "msg" => "Cet enregistrement existe déjà dans la base", "data" => NULL]);
                }
                $paramTva->update([
                    'montant_tva' => ($request->get('montant_tva')/100),
                    'updated_by' => Auth::user()->id,
                ]);
                $jsonData["data"] = json_decode($paramTva);
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\ParamTva  $paramTva
     * @return Response
     */
    public function destroy(ParamTva $paramTva)
    {
        $jsonData = ["code" => 1, "msg" => " Opération effectuée avec succès."];
            if($paramTva){
                try {
               
                $paramTva->update(['deleted_by' => Auth::user()->id]);
                $paramTva->delete();
                $jsonData["data"] = json_decode($paramTva);
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
}
