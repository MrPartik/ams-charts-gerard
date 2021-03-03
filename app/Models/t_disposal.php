<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $disposal_id
 * @property int $location_id
 * @property string $disposal_type
 * @property string $remarks
 * @property string $date_disposed
 * @property TDisposalLocation $tDisposalLocation
 */
class t_disposal extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 't_disposal';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'disposal_id';

    /**
     * @var array
     */
    protected $fillable = ['location_id', 'disposal_type', 'remarks', 'date_disposed'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tDisposalLocation()
    {
        return $this->belongsTo('App\TDisposalLocation', 'location_id', 'location_id');
    }
}
