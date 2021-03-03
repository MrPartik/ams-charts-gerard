<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $emp_id
 * @property int $department_id
 * @property string $gw_id
 * @property string $emp_name
 * @property RDepartment $rDepartment
 * @property TRequest[] $tRequests
 */
class r_employee_profile extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'r_employee_profile';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'emp_id';

    /**
     * @var array
     */
    protected $fillable = ['department_id', 'gw_id', 'emp_name'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rDepartment()
    {
        return $this->belongsTo(r_department::class, 'department_id', 'department_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tRequests()
    {
        return $this->hasMany('App\TRequest', 'emp_id', 'emp_id');
    }
}
