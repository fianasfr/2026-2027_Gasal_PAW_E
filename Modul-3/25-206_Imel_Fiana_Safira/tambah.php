<?php
include "koneksi.php";

// kalau tombol simpan ditekan
if (isset($_POST['simpan'])) {
    $nama = $_POST['nama'];
    $telp = $_POST['telp'];
    $alamat = $_POST['alamat'];

    $sql = "INSERT INTO supplier (nama, telp, alamat) VALUES ('$nama', '$telp', '$alamat')";

    if (mysqli_query($conn, $sql)) {
        header("Location: index.php?pesan=Data berhasil ditambahkan");
        exit;
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Tambah Data Master Supplier</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Tambah Data Master Supplier Baru</h1>
    <hr>

    <form method="post" action="">
        <table class="form">
            <tr>
                <td><b>Nama</b></td>
                <td><input type="text" name="nama" placeholder="Nama" class="panjang" required></td>
            </tr>
            <tr>
                <td><b>Telp</b></td>
                <td><input type="text" name="telp" placeholder="telp" maxlength="12" required></td>
            </tr>
            <tr>
                <td><b>Alamat</b></td>
                <td><input type="text" name="alamat" placeholder="alamat" required></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" name="simpan" class="btn btn-hijau">Simpan</button>
                    <a href="index.php" class="btn btn-merah">Batal</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
