<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SearchingDiskPartition extends Controller
{
    public function searchDisk()
    {
        $search = \request()->get('search');
        $data = DB::table('disk_partitions')
            ->select('*')
            ->where('created_at', 'like', '%' . $search . '%')
            ->get();
        return response([$data]);
    }
}
