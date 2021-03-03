<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $al_id
 * @property int $unit_id
 * @property int $category_id
 * @property string $al_name
 * @property string $al_description
 * @property RUnit $rUnit
 * @property RCategory $rCategory
 * @property RAsset[] $rAssets
 */
class r_asset_library extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'r_asset_library';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'al_id';

    /**
     * @var array
     */
    protected $fillable = ['unit_id', 'category_id', 'al_name', 'al_description'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rUnit()
    {
        return $this->belongsTo('App\RUnit', 'unit_id', 'unit_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rCategory()
    {
        return $this->belongsTo('App\RCategory', 'category_id', 'category_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rAssets()
    {
        return $this->hasMany('App\RAsset', 'al_id', 'al_id');
    }
}
