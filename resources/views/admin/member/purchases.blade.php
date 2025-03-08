
@extends(backpack_view('blank'))

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Purchases Page</h3>
                </div>
                <div class="card-body">
                   <div class="tree">
                        <ul>
                            <li>
                                <a href="#">Parent</a>
                                <ul>
                                    <li>
                                        <a href="#">Child</a>
                                        <ul>
                                            <li>
                                                <a href="#">Grand Child</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">Child</a>
                                        <ul>
                                            <li><a href="#">Grand Child</a></li>
                                            <li>
                                                <a href="#">Grand Child</a>
                                                <ul>
                                                    <li>
                                                        <a href="#">Great Grand Child</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Great Grand Child</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Great Grand Child</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Grand Child</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


