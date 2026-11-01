<?php
include "koneksi.php";

$id = $_GET['id'];

$sql = "DELETE FROM supplier WHERE id=$id";

if (mysqli_query($conn, $sql)) {
    header("Location: index.php?pesan=Data berhasil dihapus");
} else {
    // gagal biasanya karena supplier masih dipakai di tabel barang
    header("Location: index.php?pesan=Data gagal dihapus, supplier masih dipakai di tabel barang");
}
mysqli_close($conn);
?>
