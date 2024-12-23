using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class smalleditt : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "d8ed132c-e77f-4252-9af8-b9ff4129803f", "2ad59447-a3b9-4b76-bc3b-92c017259d23" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "d8ed132c-e77f-4252-9af8-b9ff4129803f");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "2ad59447-a3b9-4b76-bc3b-92c017259d23");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "8dae30e0-53fc-4f51-9e0f-a485ca93013c", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "37caa614-aa46-4214-9f4a-bf13cb2947ab", 0, "6245e325-84c5-4a9d-b1fa-2713fadcc45c", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAELSjnmhD85RJimI2BdjqfMOfQnWThnygqHqJXvN0bcyadBfVyqoEQtkJdWRoQdytYw==", null, false, "be3c45a9-ed33-449f-8a5d-abfdc55e23a8", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "8dae30e0-53fc-4f51-9e0f-a485ca93013c", "37caa614-aa46-4214-9f4a-bf13cb2947ab" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "8dae30e0-53fc-4f51-9e0f-a485ca93013c", "37caa614-aa46-4214-9f4a-bf13cb2947ab" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "8dae30e0-53fc-4f51-9e0f-a485ca93013c");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "37caa614-aa46-4214-9f4a-bf13cb2947ab");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "d8ed132c-e77f-4252-9af8-b9ff4129803f", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "2ad59447-a3b9-4b76-bc3b-92c017259d23", 0, "ebbfeb4a-3e2f-4c60-9d9a-0326d16a160d", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEDnN0+SgJ0x5t0YGGC7L1iGBiwCKEytsEx1eWmYhqrV2gaUjqSYatQUDcKFtDhQNkA==", null, false, "74e6c644-ea3d-4ced-be4c-05e31f3c340c", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "d8ed132c-e77f-4252-9af8-b9ff4129803f", "2ad59447-a3b9-4b76-bc3b-92c017259d23" });
        }
    }
}
