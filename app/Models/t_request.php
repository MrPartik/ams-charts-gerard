<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $request_id
 * @property int $asset_id
 * @property int $emp_id
 * @property int $quantity
 * @property int $request_status
 * @property string $date_approved
 * @property string $date_rejected
 * @property RAsset $rAsset
 * @property REmployeeProfile $rEmployeeProfile
 * @property TRelease[] $tReleases
 */
class t_request extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 't_request';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'request_id';

    /**
     * @var array
     */
    protected $fillable = ['asset_id', 'emp_id', 'quantity', 'request_status', 'date_approved', 'date_rejected'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rAsset()
    {
        return $this->belongsTo(r_assets::class, 'asset_id', 'asset_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rEmployeeProfile()
    {
        return $this->belongsTo(r_employee_profile::class, 'emp_id', 'emp_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tReleases()
    {
        return $this->hasMany('App\TRelease', 'request_id', 'request_id');
    }
}
