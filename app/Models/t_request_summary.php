<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $urs_id
 * @property int $request_no
 * @property string $purpose
 * @property int $status
 * @property string $date_requested
 * @property RAsset[] $rAssets
 */
class t_request_summary extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 't_request_summary';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'urs_id';

    /**
     * @var array
     */
    protected $fillable = ['request_no', 'purpose', 'status', 'date_requested'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rAssets()
    {
        return $this->hasMany('App\RAsset', 'urs_id', 'urs_id');
    }
}
