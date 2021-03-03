<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $asset_id
 * @property int $al_id
 * @property int $urs_id
 * @property string $asset_description
 * @property string $asset_status
 * @property string $acquisition_type
 * @property string $availability
 * @property int $disposal_status
 * @property string $date_acquired
 * @property RAssetLibrary $rAssetLibrary
 * @property TRequestSummary $tRequestSummary
 * @property TDamageReport[] $tDamageReports
 * @property TRequest[] $tRequests
 */
class r_assets extends Model
{
    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'asset_id';

    /**
     * @var array
     */
    protected $fillable = ['al_id', 'urs_id', 'asset_description', 'asset_status', 'acquisition_type', 'availability', 'disposal_status', 'date_acquired'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rAssetLibrary()
    {
        return $this->belongsTo('App\RAssetLibrary', 'al_id', 'al_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tRequestSummary()
    {
        return $this->belongsTo('App\TRequestSummary', 'urs_id', 'urs_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tDamageReports()
    {
        return $this->hasMany('App\TDamageReport', 'asset_id', 'asset_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tRequests()
    {
        return $this->hasMany('App\TRequest', 'asset_id', 'asset_id');
    }
}
