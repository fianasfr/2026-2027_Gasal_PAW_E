<?php
include "koneksi.php";
?>
<!DOCTYPE html>
<html>
<head>
    <title>Data Master Supplier</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <a href="tambah.php" class="btn btn-hijau kanan">Tambah Data</a>
    <h2>Data Master Supplier</h2>
    <hr>

    <?php
    // pesan setelah simpan / update / hapus
    if (isset($_GET['pesan'])) {
        echo "<p class='pesan'>" . htmlspecialchars($_GET['pesan']) . "</p>";
    }
    ?>

    <table>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Telp</th>
            <th>Alamat</th>
            <th>Tindakan</th>
        </tr>
        <?php
        $sql = "SELECT * FROM supplier ORDER BY id";
        $result = mysqli_query($conn, $sql);
        $no = 1;

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
        ?>
        <tr>
            <td><?php echo $no; ?></td>
            <td><?php echo $row['nama']; ?></td>
            <td><?php echo $row['telp']; ?></td>
            <td><?php echo $row['alamat']; ?></td>
            <td>
                <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-oranye">Edit</a>
                <a href="hapus.php?id=<?php echo $row['id']; ?>" class="btn btn-merah"
                   onclick="return confirm('Anda yakin akan menghapus supplier ini?')">Hapus</a>
            </td>
        </tr>
        <?php
                $no++;
            }
        } else {
            echo "<tr><td colspan='5'>Belum ada data</td></tr>";
        }
        mysqli_close($conn);
        ?>
    </table>
</div>
</body>
</html>
