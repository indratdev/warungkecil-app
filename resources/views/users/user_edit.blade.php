<section class="content" style="margin-top: 20px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Edit Form User</h3>
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

                    @foreach ($data as $usr)
                        <form action="{{ route('users.update', $usr->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="card-body">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" name="email" id="email"
                                        value="{{ $usr->email }}">
                                </div>

                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" name="name" id="name"
                                        value="{{ $usr->name }}">
                                </div>

                                <div class="form-group">
                                    <label>Gender </label>
                                    <div class="custom-control custom-radio custom-control-inline"
                                        style="margin-left: 20px">
                                        <input class="custom-control-input" type="radio" value="Male" id="male"
                                            name="gender" {{ $usr->gender == 'Male' ? 'checked' : '' }}>
                                        <label class="custom-control-label" for="male">Male</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input class="custom-control-input" type="radio" value="Female" id="female"
                                            name="gender" {{ $usr->gender == 'Female' ? 'checked' : '' }}>
                                        <label class="custom-control-label" for="female">Female</label>
                                    </div>
                                </div>

                                <div class="form-group" style=" width: 20%;">
                                    <label>Phone</label>
                                    <input type="text" class="form-control" name="phone" id="phone"
                                        value="{{ $usr->phone }}">
                                </div>

                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea class="form-control" name="address" id="address" rows="4">{{ $usr->address }}</textarea>
                                </div>

                                <input type="reset" name="reset" value="Reset" class="btn btn-dark">
                                <input type="submit" name="submit" value="Submit" class="btn btn-dark">
                            </div>

                        </form>
                    @endforeach
                </div>

            </div>

            <div class="col-md-6">
            </div>

        </div>

    </div>
</section>
