<?php

namespace App\Http\Controllers;

use App\Models\r_assets;
use App\Models\t_disposal;
use App\Models\t_request;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index() {

        $aAsset =  r_assets::select(DB::raw('count(asset_id) as total, acquisition_type as type'))
            ->groupBy('acquisition_type')
            ->get();

        $aRequests =  t_request::select('r_department.department_name as dept_name', DB::raw('count(t_request.request_id) as total'))
            ->join('r_employee_profile', 'r_employee_profile.emp_id', '=', 't_request.emp_id')
            ->join('r_department', 'r_department.department_id', '=', 'r_employee_profile.department_id')
            ->groupBy('r_department.department_name')
            ->get();

        $aDisposals = t_disposal::select(DB::raw('count(disposal_id) as total, monthname(date_disposed) as month'))
            ->groupBy(DB::raw('monthname(date_disposed)'))
            ->get()->toArray();
        $aFormattedDisposals = [];
        foreach(['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'] as $sMonth)
        {
            $aData = $aDisposals[array_search($sMonth, array_column($aDisposals, 'month'))];
            $aFormattedDisposals[$sMonth] = (@$aData['month'] === $sMonth)? $aData['total'] : 0;
        }
        return view('welcome', [
            'aAssets'  => $aAsset,
            'aRequests' => $aRequests,
            'aDisposals' => $aFormattedDisposals
        ]);
    }
}
