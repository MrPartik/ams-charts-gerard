<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $department_id
 * @property string $department_code
 * @property string $department_name
 * @property REmployeeProfile[] $rEmployeeProfiles
 */
class r_department extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'r_department';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'department_id';

    /**
     * @var array
     */
    protected $fillable = ['department_code', 'department_name'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rEmployeeProfiles()
    {
        return $this->hasMany(r_employee_profile::class, 'department_id', 'department_id');
    }
}
