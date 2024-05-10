<div class="card p-3">

    <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title">Management User</h3>
        <button type="button" class="btn bg-gradient-primary ml-auto"><a href="/users/create">New User </a></button>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $message }}</strong>
        </div>
    @endif


    <div class="card-body">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No. </th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role User</th>
                    <th>Create At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($datas as $key => $user)
                    <tr>
                        <td> {{ $key + 1 }}</td>
                        <td> {{ $user->name }}</td>
                        <td> {{ $user->email }}</td>
                        <td> {{ $user->role_user }}</td>
                        <td> {{ $user->created_at }}</td>
                        <td class="project-actions text-right">
                            <a class="btn btn-primary btn-sm" href="#">
                                <i class="fas fa-eye"></i>
                                {{-- View --}}
                            </a>
                            <a class="btn btn-info btn-sm" href="/users/{{ $user->id }}/edit">
                                <i class="fas fa-pencil-alt"></i>
                                {{-- Edit --}}
                            </a>
                            <a class="btn btn-danger btn-sm" href="#">
                                <i class="fas fa-trash"></i>
                                {{-- Delete --}}
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>



    <div class="card-footer clearfix">
        <ul class="pagination pagination-sm m-0 float-right">
            {{ $datas->links('pagination::bootstrap-4') }}
        </ul>
    </div>
</div>
