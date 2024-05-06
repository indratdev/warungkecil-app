<div class="card p-3">

    <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title">Management User</h3>
        <button type="button" class="btn bg-gradient-primary ml-auto">New User</button>
    </div>


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
                        <td style="display: flex; gap: 10px;">
                            <button type="button" class="btn bg-gradient-primary">Edit</button>
                            <button type="button" class="btn bg-gradient-info">Detail</button>
                            <button type="button" class="btn bg-gradient-danger">Hapus</button>
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
