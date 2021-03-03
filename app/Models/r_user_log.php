<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $log_id
 * @property string $gw_id
 * @property string $log_type
 * @property string $message
 */
class r_user_log extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'r_user_log';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'log_id';

    /**
     * @var array
     */
    protected $fillable = ['gw_id', 'log_type', 'message'];

}
