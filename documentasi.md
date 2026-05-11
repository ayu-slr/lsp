# Dokumentasi Aplikasi Sertifikasi (BNSP)

## Deskripsi Singkat
Aplikasi ini adalah sistem manajemen pendaftaran peserta sertifikasi berbasis web. Dibangun menggunakan framework **Laravel 13** dengan tampilan **Bootstrap 5.3**, aplikasi ini dirancang khusus untuk mempermudah administrator dalam mengelola data master Skema Sertifikasi dan data Peserta Sertifikasi, yang seluruh alurnya telah diselaraskan dengan identitas BNSP.

## Fitur Utama
1. **Multi-Role Authentication**: 
   - **Admin**: Memiliki akses penuh ke *dashboard* untuk mengelola skema dan peserta.
   - **User (Peserta)**: Memiliki panel khusus (`/user`) untuk mendaftarkan dirinya sendiri ke dalam program sertifikasi dan melihat status pendaftarannya.
2. **Otentikasi Aman**: Halaman login dan register bergaya modern dengan pembagian peran (role) otomatis secara aman.
3. **Dashboard Admin BNSP**: Panel utama yang menyajikan pintasan menu untuk mengelola data dengan cepat.
4. **Manajemen Skema Sertifikasi (CRUD)**: 
   - Admin dapat menambahkan kategori skema baru.
   - Admin dapat mengubah nama skema yang sudah ada.
   - Admin dapat menghapus skema.
5. **Manajemen Data Peserta (CRUD & Penilaian)**: 
   - Admin dapat melihat seluruh peserta yang mendaftar beserta status kelulusannya (Kompeten / Belum Kompeten).
   - Pencarian peserta spesifik melalui form pencarian nama.
   - Mendaftarkan peserta baru atau mengedit data peserta lama.
   - Mengubah status kelulusan peserta. Jika *Kompeten*, admin diwajibkan mengunggah file **sertifikat** (pdf/jpg). Jika *Belum Kompeten*, admin diwajibkan menulis **komentar** evaluasi.
6. **Sistem Notifikasi Real-time (Database)**:
   - Terdapat lonceng notifikasi interaktif di *navbar* seluruh pengguna (Admin & User).
   - **Admin** akan menerima notifikasi *pop-up dropdown* jika ada *User* baru yang mengisi form pendaftaran secara mandiri.
   - **User** akan otomatis menerima notifikasi jika ada perubahan status "Kompeten" atau "Belum Kompeten" dari assessor/admin.

## Struktur Database
Aplikasi ini menggunakan database bernama `kompeten` dengan tabel-tabel utama berikut:

**1. Tabel `users`** (Bawaan Laravel + Modifikasi)
Menyimpan kredensial sistem. Memiliki tambahan kolom `role` (String) dengan *default value* `"user"`. (Contoh: `admin@bnsp.com` / `password` dengan role `admin`).

**2. Tabel `skemas`**
- `id` (Primary Key)
- `nama_skema` (String, Unique) - Nama bidang sertifikasi (Contoh: Junior Web Programming).
- `created_at` & `updated_at` (Timestamp).

**3. Tabel `pesertas`**
- `id` (Primary Key)
- `kode_daftar` (String, Unique) - Nomor pendaftaran otomatis (BNSP-YYYYMMDD-RANDOM).
- `nama_peserta` (String) - Nama pendaftar.
- `email` (String, Unique) - Email aktif peserta.
- `telepon` (String) - No handphone / WhatsApp (Otomatis divalidasi ke awalan +62).
- `skema_sertifikasi` (String) - Merujuk pada nama skema yang dipilih.
- `status_kompetensi` (String) - Menyimpan nilai: "Belum Dinilai", "Kompeten", atau "Belum Kompeten".
- `sertifikat` (String, Nullable) - Path lokasi file sertifikat yang diunggah admin.
- `komentar` (Text, Nullable) - Catatan alasan tidak lulus dari asesor.
- `created_at` & `updated_at` (Timestamp).

**4. Tabel `notifications`**
- Digunakan secara bawaan oleh Laravel untuk mengelola riwayat notifikasi admin dan user. Menyimpan tipe notifikasi, data *JSON*, ID pengguna, dan status *read_at* jika notifikasi sudah dibaca.

## Cara Instalasi & Menjalankan Aplikasi
1. Siapkan server database MySQL dan pastikan telah membuat database kosong bernama `kompeten`.
2. Jalankan migrasi tabel beserta *seeding* akun admin:
   ```bash
   php artisan migrate
   ```
3. Mulai server pengembangan:
   ```bash
   php artisan serve
   ```
4. Buka `http://localhost:8000` di web browser Anda. Anda akan langsung diminta untuk Login.
   - **Email:** `admin@bnsp.com`
   - **Password:** `password`
5. Anda akan masuk ke Dashboard dan dapat mulai mengelola data Skema maupun data Peserta.

## Catatan Rilis
- Desain *login page* dan *dashboard* sepenuhnya telah beralih ke Bootstrap (meninggalkan tailwind/flux UI bawaan Laravel) untuk menjamin keselarasan tampilan.
- Nama "Laravel" di seluruh *title* bar dan logo sudah diubah menjadi **BNSP**.
