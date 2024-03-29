<?php

namespace App\Models\Boutique;

use Illuminate\Database\Eloquent\Model;

class ArticleVente extends Model
{

     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
     
    protected $fillable = ['quantite','article_id','retourne','divers_id', 'vente_id','remise_sur_ligne', 'prix','unite_id','depot_id','updated_by', 'deleted_by', 'created_by'];
    
    protected $dates = ['deleted_at'];
    
    public function article() {
        return $this->belongsTo('App\Models\Parametre\Article');
    }
    public function divers() {
        return $this->belongsTo('App\Models\Parametre\Divers');
    }
    public function depot() {
        return $this->belongsTo('App\Models\Parametre\Depot');
    }
    public function unite() {
        return $this->belongsTo('App\Models\Parametre\Unite');
    }
}
