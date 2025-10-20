<div class="row">
    <!-- Left: Test List -->
     <div class="bg-light mt-3 p-2">
        <input type="text" 
                wire:model.defer="search" 
                wire:keydown.enter="searchTest"
                placeholder="Search by ID or Name" 
                class="form-control mb-3">
    </div>
    <div class="col-md-6">        
        <div class="bg-light mt-3 overflow-auto" style="max-height:400px;">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Test Name</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($tests as $key => $test)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td class="text-left">{{$test->testName}}</td>
                        <td class="text-right">{{$test->testPrice}}/-</td>
                        <td class="text-center">
                            <button wire:click="addTest({{$test->id}})" class="btn btn-sm btn-success">
                                <i class="bi bi-plus-circle"></i>
                            </button>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <!-- Right: Invoice Cart -->
    <div class="col-md-6">
        <div class="bg-light mt-3 p-2 overflow-auto" style="max-height:400px;">
            <h5>Invoice Cart</h5>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Test Name</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($cart as $key => $item)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td class="text-left">{{$item['name']}}</td>
                        <td class="text-right">{{$item['price']}}/-</td>
                        <td class="text-center">
                            <button wire:click="removeTest({{$item['id']}})" class="btn btn-sm btn-danger">
                                <i class="bi bi-dash-circle"></i>
                            </button>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4">No tests added.</td>
                    </tr>
                    @endforelse
                    <tr>
                        <td colspan="2" class="text-right"><strong>Total</strong></td>
                        <td colspan="2" class="text-right"><strong>{{$total}}/-</strong></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <tr>
            <td colspan="2" class="text-right"><strong>Total: </strong></td>
            <td colspan="2" class="text-right"><strong>{{$total}}/-</strong></td>
        </tr>
    </div>
</div>