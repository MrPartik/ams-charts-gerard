<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $ins_id
 * @property int $dr_id
 * @property int $inspection_status
 * @property string $evaluation
 * @property string $date_inspected
 * @property TDamageReport $tDamageReport
 */
class t_inspection extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 't_inspection';

    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'ins_id';

    /**
     * @var array
     */
    protected $fillable = ['dr_id', 'inspection_status', 'evaluation', 'date_inspected'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tDamageReport()
    {
        return $this->belongsTo('App\TDamageReport', 'dr_id', 'dr_id');
    }
}
