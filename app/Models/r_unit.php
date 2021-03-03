<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $unit_id
 * @property string $name
 * @property RAssetLibrary[] $rAssetLibraries
 */
class r_unit extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'r_unit';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'unit_id';

    /**
     * @var array
     */
    protected $fillable = ['name'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rAssetLibraries()
    {
        return $this->hasMany('App\RAssetLibrary', 'unit_id', 'unit_id');
    }
}
