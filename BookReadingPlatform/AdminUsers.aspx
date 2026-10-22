<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="BookReadingPlatform.AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header */
        .page-header { margin-bottom: 25px; }
        .page-header h1 { margin: 0 0 4px 0; font-size: 24px; color: #0f172a; font-weight: 800; }
        .page-header p { margin: 0; font-size: 13px; color: #94a3b8; }

        /* Toolbar Row */
        .toolbar-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        .search-box { display: flex; align-items: center; background: white; border: 1px solid #e2e8f0; border-radius: 10px; padding: 8px 15px; width: 320px; box-shadow: 0 1px 2px rgba(0,0,0,0.01); }
        .search-box svg { width: 16px; height: 16px; stroke: #94a3b8; fill: none; stroke-width: 2; margin-right: 10px; }
        .search-box input { border: none; outline: none; font-size: 13px; width: 100%; color: #0f172a; background: transparent; }
        
        .btn-adduser { background: #3b82f6; color: white; border: none; padding: 10px 20px; border-radius: 10px; font-size: 13px; font-weight: 600; cursor: pointer; display: flex; align-items: center; gap: 8px; box-shadow: 0 2px 5px rgba(59, 130, 246, 0.2); }
        .btn-adduser svg { width: 16px; height: 16px; stroke: currentColor; fill: none; stroke-width: 2; }

        /* Table Card Container */
        .table-container { background: white; border-radius: 16px; border: 1px solid #edf2f7; box-shadow: 0 1px 3px rgba(0,0,0,0.02); overflow: hidden; margin-bottom: 40px; }
        
        /* Data Table */
        .admin-table { width: 100%; border-collapse: collapse; text-align: left; }
        .admin-table th { background: #f8fafc; padding: 14px 20px; font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 1px solid #edf2f7; }
        .admin-table td { padding: 16px 20px; font-size: 13px; color: #0f172a; border-bottom: 1px solid #f8fafc; vertical-align: middle; }
        .admin-table tr:last-child td { border-bottom: none; }
        .admin-table tr:hover { background: #fdfdfd; }

        /* User Profile Cell */
        .user-cell { display: flex; align-items: center; gap: 12px; }
        .u-avatar { width: 36px; height: 36px; border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: 700; color: white; flex-shrink: 0; }
        .u-info { display: flex; flex-direction: column; }
        .u-name { font-weight: 700; color: #0f172a; margin-bottom: 1px; }
        
        /* Badges */
        .badge-plan { padding: 4px 10px; border-radius: 12px; font-size: 11px; font-weight: 600; display: inline-block; width: fit-content; }
        .plan-premium { background: #eff6ff; color: #3b82f6; }
        .plan-free { background: #f0fdf4; color: #10b981; }

        .badge-status { display: flex; align-items: center; gap: 6px; font-size: 12px; font-weight: 600; width: fit-content; }
        .status-dot { width: 6px; height: 6px; border-radius: 50%; }
        .status-active { color: #10b981; }
        .status-active .status-dot { background: #10b981; }
        .status-inactive { color: #94a3b8; }
        .status-inactive .status-dot { background: #94a3b8; }

        /* Actions */
        .action-btns { display: flex; gap: 8px; }
        .btn-edit { background: #eff6ff; color: #3b82f6; border: none; padding: 6px 14px; border-radius: 6px; font-size: 12px; font-weight: 600; cursor: pointer; }
        .btn-remove { background: #fef2f2; color: #ef4444; border: none; padding: 6px 14px; border-radius: 6px; font-size: 12px; font-weight: 600; cursor: pointer; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1>User Management</h1>
        <p>7 total users</p>
    </div>

    <!-- Search & Add User Row -->
    <div class="toolbar-row">
        <div class="search-box">
            <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <input type="text" placeholder="Search users..." />
        </div>
        <button type="button" class="btn-adduser">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
            Add User
        </button>
    </div>

    <!-- Users Table Container -->
    <div class="table-container">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Email</th>
                    <th>Plan</th>
                    <th>Books</th>
                    <th>Joined</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                
                <!-- Row 1 -->
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="u-avatar" style="background: #eab308;">AS</div>
                            <div class="u-info"><span class="u-name">Arjun Sharma</span></div>
                        </div>
                    </td>
                    <td style="color: #64748b;">arjun.sharma@example.com</td>
                    <td><span class="badge-plan plan-premium">Premium</span></td>
                    <td style="font-weight: 600;">12</td>
                    <td style="color: #64748b;">Jan 12, 2025</td>
                    <td><div class="badge-status status-active"><div class="status-dot"></div>Active</div></td>
                    <td>
                        <div class="action-btns">
                            <button class="btn-edit">Edit</button>
                            <button class="btn-remove">Remove</button>
                        </div>
                    </td>
                </tr>

                <!-- Row 2 -->
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="u-avatar" style="background: #10b981;">PP</div>
                            <div class="u-info"><span class="u-name">Priya Patel</span></div>
                        </div>
                    </td>
                    <td style="color: #64748b;">priya.patel@example.com</td>
                    <td><span class="badge-plan plan-free">Free</span></td>
                    <td style="font-weight: 600;">5</td>
                    <td style="color: #64748b;">Feb 3, 2025</td>
                    <td><div class="badge-status status-active"><div class="status-dot"></div>Active</div></td>
                    <td>
                        <div class="action-btns">
                            <button class="btn-edit">Edit</button>
                            <button class="btn-remove">Remove</button>
                        </div>
                    </td>
                </tr>

                <!-- Row 3 -->
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="u-avatar" style="background: #06b6d4;">RV</div>
                            <div class="u-info"><span class="u-name">Rohit Verma</span></div>
                        </div>
                    </td>
                    <td style="color: #64748b;">rohit.verma@example.com</td>
                    <td><span class="badge-plan plan-premium">Premium</span></td>
                    <td style="font-weight: 600;">28</td>
                    <td style="color: #64748b;">Mar 15, 2025</td>
                    <td><div class="badge-status status-active"><div class="status-dot"></div>Active</div></td>
                    <td>
                        <div class="action-btns">
                            <button class="btn-edit">Edit</button>
                            <button class="btn-remove">Remove</button>
                        </div>
                    </td>
                </tr>

                <!-- Row 4 -->
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="u-avatar" style="background: #3b82f6;">SG</div>
                            <div class="u-info"><span class="u-name">Sneha Gupta</span></div>
                        </div>
                    </td>
                    <td style="color: #64748b;">sneha.gupta@example.com</td>
                    <td><span class="badge-plan plan-free">Free</span></td>
                    <td style="font-weight: 600;">2</td>
                    <td style="color: #64748b;">Apr 1, 2025</td>
                    <td><div class="badge-status status-inactive"><div class="status-dot"></div>Inactive</div></td>
                    <td>
                        <div class="action-btns">
                            <button class="btn-edit">Edit</button>
                            <button class="btn-remove">Remove</button>
                        </div>
                    </td>
                </tr>

                <!-- Row 5 -->
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="u-avatar" style="background: #8b5cf6;">VS</div>
                            <div class="u-info"><span class="u-name">Vikram Singh</span></div>
                        </div>
                    </td>
                    <td style="color: #64748b;">vikram.singh@example.com</td>
                    <td><span class="badge-plan plan-premium">Premium</span></td>
                    <td style="font-weight: 600;">19</td>
                    <td style="color: #64748b;">Apr 20, 2025</td>
                    <td><div class="badge-status status-active"><div class="status-dot"></div>Active</div></td>
                    <td>
                        <div class="action-btns">
                            <button class="btn-edit">Edit</button>
                            <button class="btn-remove">Remove</button>
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

</asp:Content>