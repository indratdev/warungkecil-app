<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

class UtilityController extends Controller
{
    private  $perPage = 10; // number of paginate

    public function generatePaginator($dataCollection)
    {
        $collection = new Collection($dataCollection);
        $page = LengthAwarePaginator::resolveCurrentPage();

        $paginator = new LengthAwarePaginator(
            $collection->forPage($page, $this->perPage), // Item pada halaman saat ini
            $collection->count(), // Total jumlah item dalam koleksi
            $this->perPage, // Jumlah item per halaman
            $page, // Halaman saat ini
            ['path' => LengthAwarePaginator::resolveCurrentPath()] // Opsional: path untuk link halaman paginasi
        );

        return $paginator;
    }
}
