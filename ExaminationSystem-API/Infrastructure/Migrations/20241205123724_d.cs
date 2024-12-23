using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class d : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "69a1702c-6470-45f0-8006-97bcb73a8594", "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "69a1702c-6470-45f0-8006-97bcb73a8594");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda");

            migrationBuilder.AddColumn<int>(
                name: "PassScore",
                table: "Exams",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "70322f81-0f62-42ff-9974-340c5bfb5416", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "d798b7ac-1973-42ae-8466-db12d2060c4d", 0, "0b9a188d-2477-4db9-97b9-625b86d8e70f", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAELSD+BwJ4q42EO3EiDk4Jgyd4GE1eA57SZWACEbBX+l0dCk4uhVb/EYZ+IVGvOc+qg==", null, false, "d97b545b-f5d4-473d-97b3-0f611a80fb2e", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "70322f81-0f62-42ff-9974-340c5bfb5416", "d798b7ac-1973-42ae-8466-db12d2060c4d" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "70322f81-0f62-42ff-9974-340c5bfb5416", "d798b7ac-1973-42ae-8466-db12d2060c4d" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "70322f81-0f62-42ff-9974-340c5bfb5416");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "d798b7ac-1973-42ae-8466-db12d2060c4d");

            migrationBuilder.DropColumn(
                name: "PassScore",
                table: "Exams");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "69a1702c-6470-45f0-8006-97bcb73a8594", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda", 0, "819ccd87-c76a-4fcd-ac84-6fec8ba43cbd", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEOWHoUEdqjpqvB/MyqWdH+R97yn9z3mHbFsCI/Kzxa81MAMtAYPQLMyBkJgm+OijRA==", null, false, "85181bf7-c553-43a6-a9d6-557aa5b5ae1d", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "69a1702c-6470-45f0-8006-97bcb73a8594", "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda" });
        }
    }
}
