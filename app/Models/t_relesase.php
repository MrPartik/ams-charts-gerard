<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $release_id
 * @property int $request_id
 * @property int $release_status
 * @property string $remarks
 * @property string $date_released
 * @property TRequest $tRequest
 */
class t_relesase extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 't_release';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'release_id';

    /**
     * @var array
     */
    protected $fillable = ['request_id', 'release_status', 'remarks', 'date_released'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tRequest()
    {
        return $this->belongsTo('App\TRequest', 'request_id', 'request_id');
    }
}
