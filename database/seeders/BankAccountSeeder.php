<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\BankDetail;

class BankAccountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        BankDetail::insert([
            [
                'bank_name'       => 'Dutch-Bangla Bank Ltd',
                'branch_name'     => 'Dhanmondi Branch',
                'account_name'    => 'Samim Hossain',
                'account_number'  => '12345678901',
                'routing_number'  => '090261234',
                'remarks'         => 'Primary business account',
            ],
            [
                'bank_name'       => 'BRAC Bank Ltd',
                'branch_name'     => 'Gulshan Branch',
                'account_name'    => 'Samim Hossain',
                'account_number'  => '98765432109',
                'routing_number'  => '060123456',
                'remarks'         => 'Savings account',
            ],
            [
                'bank_name'       => 'Islami Bank Bangladesh Ltd',
                'branch_name'     => 'Mirpur Branch',
                'account_name'    => 'Samim Hossain',
                'account_number'  => '45678912300',
                'routing_number'  => '125678900',
                'remarks'         => 'Personal account',
            ],
        ]);
    }
}
