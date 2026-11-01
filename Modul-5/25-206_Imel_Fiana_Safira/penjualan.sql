-- TP5 PAW : Database penjualan
CREATE DATABASE IF NOT EXISTS penjualan;
USE penjualan;

-- ================= STRUKTUR TABEL =================
CREATE TABLE supplier (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  telp VARCHAR(12) NOT NULL,
  alamat TEXT NOT NULL
);

CREATE TABLE barang (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  kode_barang VARCHAR(10) NOT NULL,
  nama_barang VARCHAR(100) NOT NULL,
  harga INT(11) NOT NULL,
  stok INT(11) NOT NULL,
  supplier_id INT(11) NOT NULL,
  FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE pelanggan (
  id VARCHAR(20) NOT NULL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  jenis_kelamin ENUM('L','P') NOT NULL,
  telp VARCHAR(12) NOT NULL,
  alamat TEXT NOT NULL
);

CREATE TABLE transaksi (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  waktu_transaksi DATE NOT NULL,
  keterangan TEXT,
  total INT(11) NOT NULL,
  pelanggan_id VARCHAR(20) NOT NULL,
  FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
);

CREATE TABLE transaksi_detail (
  transaksi_id INT(11) NOT NULL,
  barang_id INT(11) NOT NULL,
  harga INT(11) NOT NULL,
  qty INT(11) NOT NULL,
  PRIMARY KEY (transaksi_id, barang_id),
  FOREIGN KEY (transaksi_id) REFERENCES transaksi(id),
  FOREIGN KEY (barang_id) REFERENCES barang(id)
);

CREATE TABLE pembayaran (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  waktu_bayar DATETIME NOT NULL,
  total INT(11) NOT NULL,
  metode ENUM('TUNAI','TRANSFER','EDC') NOT NULL,
  transaksi_id INT(11) NOT NULL,
  FOREIGN KEY (transaksi_id) REFERENCES transaksi(id)
);

CREATE TABLE user (
  id_user TINYINT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  password VARCHAR(35) NOT NULL,
  nama VARCHAR(50) NOT NULL,
  alamat VARCHAR(150) NOT NULL,
  hp VARCHAR(20) NOT NULL,
  level TINYINT(1) NOT NULL
);

-- ================= ISI DATA (minimal 10 per tabel) =================
INSERT INTO supplier (nama, telp, alamat) VALUES
('PT. Maju Bersama', '08123456', 'Surabaya'),
('PT. Senang Sekali', '081515563', 'Bangkalan'),
('PT. Segar Segar', '0845454663', 'Surabaya'),
('CV. Sumber Rejeki', '081234567890', 'Sidoarjo'),
('CV. Berkah Jaya', '082233445566', 'Gresik'),
('PT. Makmur Sentosa', '081355667788', 'Malang'),
('UD. Tani Makmur', '085711223344', 'Mojokerto'),
('PT. Indah Abadi', '087788990011', 'Surabaya'),
('CV. Cahaya Baru', '081299887766', 'Lamongan'),
('PT. Sinar Mulia', '082144556677', 'Madiun'),
('UD. Karya Mandiri', '081911112222', 'Kediri'),
('CV. Harapan Kita', '085233334444', 'Jombang');

INSERT INTO barang (kode_barang, nama_barang, harga, stok, supplier_id) VALUES
('BRG001', 'Beras 5kg', 65000, 50, 1),
('BRG002', 'Minyak Goreng 2L', 38000, 40, 2),
('BRG003', 'Gula Pasir 1kg', 16000, 100, 3),
('BRG004', 'Telur Ayam 1kg', 28000, 60, 4),
('BRG005', 'Mie Instan', 3500, 200, 5),
('BRG006', 'Kopi Sachet', 2000, 150, 6),
('BRG007', 'Teh Celup', 12000, 80, 7),
('BRG008', 'Susu UHT 1L', 18000, 70, 8),
('BRG009', 'Sabun Mandi', 4500, 90, 9),
('BRG010', 'Deterjen 1kg', 22000, 45, 10);

INSERT INTO pelanggan (id, nama, jenis_kelamin, telp, alamat) VALUES
('P001', 'Budi Santoso', 'L', '081211110001', 'Surabaya'),
('P002', 'Siti Aminah', 'P', '081211110002', 'Sidoarjo'),
('P003', 'Andi Wijaya', 'L', '081211110003', 'Gresik'),
('P004', 'Dewi Lestari', 'P', '081211110004', 'Malang'),
('P005', 'Rudi Hartono', 'L', '081211110005', 'Surabaya'),
('P006', 'Rina Marlina', 'P', '081211110006', 'Bangkalan'),
('P007', 'Joko Susilo', 'L', '081211110007', 'Mojokerto'),
('P008', 'Lina Wati', 'P', '081211110008', 'Lamongan'),
('P009', 'Agus Prayitno', 'L', '081211110009', 'Madiun'),
('P010', 'Maya Sari', 'P', '081211110010', 'Kediri');

INSERT INTO transaksi (waktu_transaksi, keterangan, total, pelanggan_id) VALUES
('2026-10-01', 'Beli beras', 130000, 'P001'),
('2026-10-02', 'Beli minyak goreng', 38000, 'P002'),
('2026-10-03', 'Beli gula', 48000, 'P003'),
('2026-10-04', 'Beli telur', 56000, 'P004'),
('2026-10-05', 'Beli mie instan', 35000, 'P005'),
('2026-10-06', 'Beli kopi', 10000, 'P006'),
('2026-10-07', 'Beli teh', 24000, 'P007'),
('2026-10-08', 'Beli susu', 72000, 'P008'),
('2026-10-09', 'Beli sabun', 27000, 'P009'),
('2026-10-10', 'Beli deterjen', 22000, 'P010');

INSERT INTO transaksi_detail (transaksi_id, barang_id, harga, qty) VALUES
(1, 1, 65000, 2),
(2, 2, 38000, 1),
(3, 3, 16000, 3),
(4, 4, 28000, 2),
(5, 5, 3500, 10),
(6, 6, 2000, 5),
(7, 7, 12000, 2),
(8, 8, 18000, 4),
(9, 9, 4500, 6),
(10, 10, 22000, 1);

INSERT INTO pembayaran (waktu_bayar, total, metode, transaksi_id) VALUES
('2026-10-01 10:00:00', 130000, 'TUNAI', 1),
('2026-10-02 11:15:00', 38000, 'TRANSFER', 2),
('2026-10-03 09:30:00', 48000, 'EDC', 3),
('2026-10-04 13:45:00', 56000, 'TUNAI', 4),
('2026-10-05 14:20:00', 35000, 'TRANSFER', 5),
('2026-10-06 08:50:00', 10000, 'TUNAI', 6),
('2026-10-07 15:10:00', 24000, 'EDC', 7),
('2026-10-08 16:00:00', 72000, 'TRANSFER', 8),
('2026-10-09 12:30:00', 27000, 'TUNAI', 9),
('2026-10-10 17:25:00', 22000, 'EDC', 10);

INSERT INTO user (username, password, nama, alamat, hp, level) VALUES
('admin', MD5('admin123'), 'Administrator', 'Surabaya', '081300000001', 1),
('kasir1', MD5('kasir123'), 'Kasir Satu', 'Sidoarjo', '081300000002', 2),
('kasir2', MD5('kasir123'), 'Kasir Dua', 'Gresik', '081300000003', 2),
('kasir3', MD5('kasir123'), 'Kasir Tiga', 'Malang', '081300000004', 2),
('gudang1', MD5('gudang123'), 'Staff Gudang Satu', 'Surabaya', '081300000005', 3),
('gudang2', MD5('gudang123'), 'Staff Gudang Dua', 'Bangkalan', '081300000006', 3),
('manager', MD5('manager123'), 'Manager Toko', 'Surabaya', '081300000007', 1),
('owner', MD5('owner123'), 'Pemilik Toko', 'Surabaya', '081300000008', 1),
('kasir4', MD5('kasir123'), 'Kasir Empat', 'Mojokerto', '081300000009', 2),
('kasir5', MD5('kasir123'), 'Kasir Lima', 'Lamongan', '081300000010', 2);
