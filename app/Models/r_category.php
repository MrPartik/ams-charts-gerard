<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $category_id
 * @property string $category_name
 * @property RAssetLibrary[] $rAssetLibraries
 */
class r_category extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'r_category';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'category_id';

    /**
     * @var array
     */
    protected $fillable = ['category_name'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rAssetLibraries()
    {
        return $this->hasMany('App\RAssetLibrary', 'category_id', 'category_id');
    }
}
