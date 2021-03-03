<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $dr_id
 * @property int $asset_id
 * @property int $dr_no
 * @property string $reason
 * @property string $date_reported
 * @property RAsset $rAsset
 * @property TInspection[] $tInspections
 */
class t_damage_report extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 't_damage_report';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'dr_id';

    /**
     * @var array
     */
    protected $fillable = ['asset_id', 'dr_no', 'reason', 'date_reported'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rAsset()
    {
        return $this->belongsTo('App\RAsset', 'asset_id', 'asset_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tInspections()
    {
        return $this->hasMany('App\TInspection', 'dr_id', 'dr_id');
    }
}
