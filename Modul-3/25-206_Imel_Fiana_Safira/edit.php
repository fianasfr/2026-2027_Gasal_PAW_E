<?php
include "koneksi.php";

// kalau tombol update ditekan
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $telp = $_POST['telp'];
    $alamat = $_POST['alamat'];

    $sql = "UPDATE supplier SET nama='$nama', telp='$telp', alamat='$alamat' WHERE id=$id";

    if (mysqli_query($conn, $sql)) {
        header("Location: index.php?pesan=Data berhasil diubah");
        exit;
    } else {
        echo "Error updating record: " . mysqli_error($conn);
    }
}

// ambil data lama berdasarkan id
$id = $_GET['id'];
$sql = "SELECT * FROM supplier WHERE id=$id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Data Master Supplier</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Edit Data Master Supplier</h1>
    <hr>

    <form method="post" action="">
        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
        <table class="form">
            <tr>
                <td><b>Nama</b></td>
                <td><input type="text" name="nama" value="<?php echo $row['nama']; ?>" class="panjang" required></td>
            </tr>
            <tr>
                <td><b>Telp</b></td>
                <td><input type="text" name="telp" value="<?php echo $row['telp']; ?>" maxlength="12" required></td>
            </tr>
            <tr>
                <td><b>Alamat</b></td>
                <td><input type="text" name="alamat" value="<?php echo $row['alamat']; ?>" required></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" name="update" class="btn btn-hijau">Update</button>
                    <a href="index.php" class="btn btn-merah">Batal</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
