<div id="sidebar" class="active">
    <div class="sidebar-wrapper active">
        <div class="sidebar-header">
            <div class="d-flex justify-content-between">
                <div class="logo">
                    <a href="{{ url('/dashboard') }}"><img src="assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                </div>
                <div class="toggler">
                    <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                </div>
            </div>
        </div>
        <div class="sidebar-menu">
            <ul class="menu">
                <li class="sidebar-title">Main Menu</li>

                <li class="sidebar-item {{ Request::is('dashboard') ? 'active' : '' }}">
                    <a href="{{ url('/dashboard') }}" class="sidebar-link">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <!-- Outdoor Management -->
                <li class="sidebar-item has-sub {{ Request::is('patients*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-person-lines-fill"></i>
                        <span>Outdoor Management</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('patients') ? 'active' : '' }}"><a href="{{ url('/patients') }}">All Patients</a></li>
                        <li class="submenu-item {{ Request::is('patients/outdoor') ? 'active' : '' }}"><a href="{{ url('/patients/outdoor') }}">Outdoor Patients</a></li>
                        <li class="submenu-item"><a href="#">Ticket</a></li>
                    </ul>
                </li>

                <!-- Indoor Management -->
                <li class="sidebar-item has-sub {{ Request::is('indoors*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-person-lines-fill"></i>
                        <span>Indoor Management</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('indoors') ? 'active' : '' }}"><a href="{{ url('/indoors') }}">All Patients</a></li>
                        <li class="submenu-item {{ Request::is('indoors/admit') ? 'active' : '' }}"><a href="{{ url('/indoors/admit') }}">Indoor Patients</a></li>
                        <li class="submenu-item {{ Request::is('indoors/advance/bill/pay') ? 'active' : '' }}"><a href="{{ url('/indoors/advance/bill/pay') }}">Advance Pay</a></li>                        
                        <li class="submenu-item {{ Request::is('indoors/bill/prepared') ? 'active' : '' }}"><a href="{{ url('/indoors/bill/prepared') }}">Bill Prepared</a></li>
                        <li class="submenu-item {{ Request::is('indoors/patient-discharge-list') ? 'active' : '' }}"><a href="{{ route('patient.dischange.list') }}">Dischange</a></li>
                    </ul>
                </li>

                <!-- Laboratory -->
                <li class="sidebar-item has-sub {{ Request::is('labs*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-clipboard2-pulse"></i>
                        <span>Laboratory</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('labs/') ? 'active' : '' }}"><a href="{{ route('lab.test.list') }}">Test List</a></li>
                        <li class="submenu-item {{ Request::is('labs/reports') ? 'active' : '' }}"><a href="{{ route('test.lab.report') }}">Lab Reports</a></li>
                        <li class="submenu-item {{ Request::is('labs/raw-materials') ? 'active' : '' }}"><a href="{{ url('/labs/raw-materials') }}">Raw Materials</a></li>
                        <li class="submenu-item {{ Request::is('labs/stock') ? 'active' : '' }}"><a href="{{ url('/labs/stock') }}">Chemical Stock</a></li>
                        <li class="submenu-item {{ Request::is('labs/reagent/test/enrolled') ? 'active' : '' }}"><a href="{{ url('/labs/reagent/test/enrolled') }}">Enrolled</a></li>
                        <li class="submenu-item {{ Request::is('labs/setting') ? 'active' : '' }}"><a href="{{ url('/labs/setting') }}">Setting</a></li>
                    </ul>
                </li>

                <!-- Accounts -->
                <li class="sidebar-item has-sub {{ Request::is('accounts*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-cash-stack"></i>
                        <span>Accounts</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('accounts/invoices') ? 'active' : '' }}"><a href="{{ url('/accounts/invoices') }}">Invoices</a></li>
                        <li class="submenu-item {{ Request::is('accounts/expenses') ? 'active' : '' }}"><a href="{{ url('/accounts/expenses') }}">Expenses</a></li>
                        <li class="submenu-item {{ Request::is('accounts/payments') ? 'active' : '' }}"><a href="{{ url('/accounts/payments') }}">Payments</a></li>
                        <li class="submenu-item {{ Request::is('accounts/report') ? 'active' : '' }}"><a href="{{ url('/accounts/report') }}">Account Reports</a></li>
                    </ul>
                </li>

                <!-- Staff Management -->
                <li class="sidebar-item has-sub {{ Request::is('staff*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-people-fill"></i>
                        <span>Staff Management</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('staff') ? 'active' : '' }}"><a href="{{ url('/staff') }}">All Staff</a></li>
                        <li class="submenu-item {{ Request::is('staff/roles') ? 'active' : '' }}"><a href="{{ url('/staff/roles') }}">Roles & Permissions</a></li>
                        <li class="submenu-item {{ Request::is('staff/salary') ? 'active' : '' }}"><a href="{{ url('/staff/salary') }}">Salary</a></li>
                    </ul>
                </li>

                <!-- Reports -->
                <li class="sidebar-item has-sub {{ Request::is('reports*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-graph-up"></i>
                        <span>Reports</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('reports/daily') ? 'active' : '' }}"><a href="{{ url('/reports/daily') }}">Daily Reports</a></li>
                        <li class="submenu-item {{ Request::is('reports/monthly') ? 'active' : '' }}"><a href="{{ url('/reports/monthly') }}">Monthly Reports</a></li>
                        <li class="submenu-item {{ Request::is('reports/financial') ? 'active' : '' }}"><a href="{{ url('/reports/financial') }}">Financial Reports</a></li>
                    </ul>
                </li>

                <!-- Settings -->
                <li class="sidebar-item has-sub {{ Request::is('settings*') ? 'active' : '' }}">
                    <a href="#" class="sidebar-link">
                        <i class="bi bi-gear-fill"></i>
                        <span>Settings</span>
                    </a>
                    <ul class="submenu">
                        <li class="submenu-item {{ Request::is('settings') ? 'active' : '' }}"><a href="{{ url('/settings') }}">Setting</a></li>
                        <li class="submenu-item {{ Request::is('settings/profile') ? 'active' : '' }}"><a href="{{ url('/settings/profile') }}">Profile Settings</a></li>
                        <li class="submenu-item {{ Request::is('settings/backup') ? 'active' : '' }}"><a href="{{ url('/settings/backup') }}">Database Backup</a></li>
                        <li class="submenu-item {{ Request::is('settings/notifications') ? 'active' : '' }}"><a href="{{ url('/settings/notifications') }}">Notifications</a></li>
                    </ul>
                </li>

                <!-- Logout -->
                <li class="sidebar-item {{ Request::is('logout') ? 'active' : '' }}">
                    <a href="{{ url('/logout') }}" class="sidebar-link text-danger">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>

        </div>
        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
    </div>
</div>