# BNSP Certification Management App

Aplikasi berbasis web untuk mengelola pendaftaran peserta sertifikasi profesi beserta dengan skema sertifikasinya. Aplikasi dirancang sederhana namun profesional menggunakan teknologi web modern.

## 🛠 Teknologi yang Digunakan
1. **Framework Backend**: Laravel 13 (PHP)
2. **Framework Frontend / Tampilan**: Bootstrap 5.3 (CSS & JS)
3. **Database**: MySQL
4. **Authentication**: Laravel Breeze (Volt/Livewire Component) yang telah dimodifikasi agar tampilannya menyatu dengan Bootstrap.
5. **Tipografi & Ikon**: Google Fonts (Plus Jakarta Sans) & Bootstrap Icons.

## 📁 Struktur Folder yang Dimodifikasi
Selama pengembangan aplikasi ini, kita fokus memodifikasi dan membangun file-file pada direktori berikut:

```text
j:\Sertikom
│
├── app/
│   ├── Http/Controllers/
│   │   ├── PesertaController.php    # (Logic CRUD Data Peserta Admin)
│   │   ├── SkemaController.php      # (Logic CRUD Data Skema Sertifikasi)
│   │   └── UserPanelController.php  # (Logic Pendaftaran Sertifikasi oleh Peserta)
│   │
│   ├── Http/Middleware/
│   │   └── CheckRole.php            # (Middleware pengaman untuk pembagian hak akses Admin/User)
│   │
│   └── Models/
│       ├── Peserta.php              # (Model untuk tabel pesertas)
│       ├── Skema.php                # (Model untuk tabel skemas)
│       └── User.php                 # (Model untuk tabel users, dengan tambahan role)
│
├── database/
│   └── migrations/                  
│       ├── ..._add_role_to_users_table.php # (Penambahan kolom Role)
│       ├── ..._create_pesertas_table.php   # (Definisi kolom tabel pesertas)
│       └── ..._create_skemas_table.php     # (Definisi kolom tabel skemas)
│
├── resources/
│   └── views/
│       ├── layouts/
│       │   ├── admin.blade.php           # (Layout utama Dashboard & Admin dengan Bootstrap)
│       │   ├── user.blade.php            # (Layout khusus panel pendaftaran Peserta)
│       │   └── auth-bootstrap.blade.php  # (Layout pembungkus form Login agar menggunakan Bootstrap)
│       │
│       ├── peserta/
│       │   ├── index.blade.php           # (Halaman tabel data peserta & pencarian)
│       │   ├── create.blade.php          # (Form tambah peserta)
│       │   └── edit.blade.php            # (Form edit peserta)
│       │
│       ├── skema/
│       │   ├── index.blade.php           # (Halaman tabel master data skema)
│       │   ├── create.blade.php          # (Form tambah skema)
│       │   └── edit.blade.php            # (Form edit skema)
│       │
│       ├── livewire/auth/
│       │   └── login.blade.php           # (Halaman Auth Login yang dirombak ulang menggunakan Bootstrap)
│       │
│       ├── dashboard.blade.php           # (Halaman landing page setelah admin login, menampilkan pintasan menu)
│       └── components/app-logo.blade.php # (Komponen pengganti nama "Laravel" menjadi "BNSP" di auth bawaan)
│
├── routes/
│   └── web.php                      # (Pendefinisian URL/Route aplikasi. Diubah agar '/' mengarah ke login)
│
├── .env                             # (Menyimpan kredensial database & nama aplikasi `APP_NAME=BNSP`)
└── documentasi.md                   # (Dokumentasi lengkap penjelasan fitur aplikasi)
```

## Hak Akses & Multi-Role
Sistem ini menggunakan mekanisme **Multi-Role Authentication**:
1. **Admin (`role = admin`)**: 
   - Hanya pengguna dengan akses *admin* yang bisa mengakses rute CRUD di *dashboard* (`/dashboard`, `/peserta`, `/skema`) untuk mengelola master data.
   - Admin bertugas menilai kelulusan peserta. Jika peserta disetel "Kompeten", admin **wajib mengunggah e-Sertifikat**. Jika "Belum Kompeten", admin **wajib memberikan komentar evaluasi**.

## Fitur Utama Baru
- ✨ **Nomor Pendaftaran Otomatis**: Setiap peserta mendapatkan kode unik (Format: `BNSP-YYYYMMDD-RANDOM`) saat mendaftar, yang juga berfungsi sebagai nomor sertifikat.
- ✨ **Otomatisasi Kredensial**: Validasi nomor telepon otomatis minimal 10 angka, kebal dari input huruf, dan terkonversi otomatis ke label `+62` murni tanpa duplikasi nol.
- ✨ **Database-Driven Notifications**: Lonceng notifikasi canggih di baris navigasi atas (Navbar). Admin akan ditegur oleh sistem jika ada pendaftar baru, dan Peserta akan di-ping jika status kelulusannya dinilai.
- ✨ **WIB (Asia/Jakarta)**: Seluruh rekaman waktu pendaftaran di dalam sistem diikat secara ketat pada siklus Waktu Indonesia Barat.
2. **Peserta (`role = user`)**: 
   - Saat mendaftar akun baru, *default role* adalah user. 
   - Mereka dapat login dan mengakses URL `/user` yang menyediakan formulir khusus untuk mendaftarkan diri secara mandiri tanpa bisa mengintip area admin. 
   - Pada panel peserta, mereka bisa melihat status kelulusan mereka. Jika lulus, terdapat tombol unduh sertifikat. Jika belum lulus, terdapat alasan evaluasi dari admin.
   - Sistem ini dijaga dengan kuat menggunakan middleware buatan kita: `CheckRole.php`.



## password admin123
