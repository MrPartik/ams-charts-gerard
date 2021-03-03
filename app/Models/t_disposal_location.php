<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $location_id
 * @property string $location_code
 * @property string $location_description
 * @property TDisposal[] $tDisposals
 */
class t_disposal_location extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 't_disposal_location';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'location_id';

    /**
     * @var array
     */
    protected $fillable = ['location_code', 'location_description'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tDisposals()
    {
        return $this->hasMany('App\TDisposal', 'location_id', 'location_id');
    }
}
