<section class="content" style="margin-top: 20px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Add New User</h3>
                    </div>

                    @if ($errors->any())
                        <div class="alert alert-danger alert-dismissible fade show" style="margin: 20px 20px 20px 20px;;">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    @if ($message = Session::get('success'))
                        <div class="alert alert-success alert-block">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>{{ $message }}</strong>
                        </div>
                    @endif

                    <form action="{{ route('users.store') }}" method="POST" enctype="multipart/form-data">
                        <div class="card-body">
                            @csrf
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" class="form-control" name="email" id="email">
                            </div>

                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="name" id="name">
                            </div>

                            <div class="form-group" style=" width: 20%;">
                                <label>Birth Date</label>
                                <input type="date" class="form-control" name="bday" id="bday">
                            </div>

                            <div class="form-group">
                                <label>Gender </label>
                                <div class="custom-control custom-radio custom-control-inline"
                                    style="margin-left: 20px">
                                    <input class="custom-control-input" type="radio" value="Male" id="male"
                                        name="gender">
                                    <label class="custom-control-label" for="male">Male</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input class="custom-control-input" type="radio" value="Female" id="female"
                                        name="gender">
                                    <label class="custom-control-label" for="female">Female</label>
                                </div>
                            </div>

                            <div class="form-group" style=" width: 20%;">
                                <label>Phone</label>
                                <input type="text" class="form-control" name="phone" id="phone">
                            </div>

                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" name="address" id="address" rows="4"></textarea>
                            </div>


                            <div class="form-group" style=" width: 50%;">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password" id="password">
                            </div>

                            <input type="reset" name="reset" value="Reset" class="btn btn-dark">
                            <input type="submit" name="submit" value="Submit" class="btn btn-dark">
                        </div>
                    </form>
                </div>

            </div>

            <div class="col-md-6">
            </div>

        </div>

    </div>
</section>
