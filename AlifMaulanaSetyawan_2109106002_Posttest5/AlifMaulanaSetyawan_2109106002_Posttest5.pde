int numStars = 50; // Jumlah Bintang
int[] starX = new int[numStars];
int[] starY = new int[numStars];

float roketMove = 0; // Posisi awal roket
int portalWidth = 0; // Ukuran awal lebar portal

int nilaiXBumi = 0; // Nilai x sebagai penggerak bumi

int nilaiXBulan = 0; // Nilai x sebagai penggerak bulan

int nilaiXMars = 0; // Nilai x sebagai penggerak mars

float scaleValueBumi = 0.9; // Nilai awal scale atmosfir bumi
float scaleValueMars = 1.0; // Nilai awal scale atmosfir mars

float sudutPortal = 0; // Sudut awal portal
float KecepatanPutarPortal = radians(3);  // Kecepatan putaran portal
boolean putarSekali = false; // Kondisi awal nilai putarsekali

void setup() {
  size(1225, 765);
  smooth(); // Memperhalus tepi gambar 
  
  frameRate(60); // Nilai frame
  
  generateRandomStars(); // Memanggil fungsi membuat bintang
}

void draw() {
  // Menggambar ulang background
  drawBackground();
  
  // Memanggil fungsi menampilkan nama
  drawNama();
 
  // Menggambar bumi
  drawBumi();
  
  // Menggambar bulan
  drawBulan();

  // menggambar mars
  drawMars();
  
  // Menggambar portal
  drawPortal();

  // Menggambar roket
  drawRoket();
  
  // Kecepatan roket
  int roketSpeed = 3;

  // Menggerakan roket ke Kanan
  roketMove += roketSpeed;
  
  // Kondisi untuk memutar portal
  if (!putarSekali) {
    sudutPortal += KecepatanPutarPortal; // Sudut portal akan terus bertambah 
    if (sudutPortal >= PI) { // 1 putaran
      sudutPortal = 0; // Reset sudut portal
      putarSekali = true;  // Menandakan portal telah berputar sekali
    }
  }

  // Percabangan if dengan operator relasi dan logika untuk membuat seluruh gambar kembali ke posisi semula 
  if (roketMove >= 330 || portalWidth >= 110) {
    // Kembalikan roket ke posisi awal 
    roketMove = -200; // lebar roket
    
    // Kembalikan ukuran lebar portal ke awal
    portalWidth = 0;
    
    // Kembalikan posisi bumi ke awal
    nilaiXBumi = 20;
    
    // Kembalikan posisi bulan ke awal
    nilaiXBulan = 35;
    
    // Kembalikan posisi mars ke awal
    nilaiXMars = 45;
    
    // Reset nilai putarSekali
    putarSekali = false;
  }else{
    
    // Mengubah nilai lebar portal
    int s = second() % 2; // Fungsi second() dengan modulo 2 agar rentang 0-1 sehingga perubahan terjadi dengan cepat
    portalWidth += s;
    
    // Menggerakkan bumi ke kiri
    nilaiXBumi += -frameCount % 4;
    
    // Menggerakkan bulan ke kiri
    nilaiXBulan += -frameCount % 4;
    
    // Menggerakkan Mars ke kiri
    nilaiXMars += -frameCount % 4;
  }
}

void drawBackground(){
  background(13, 36, 77); // Biru Gelap
  
  // Menggambar bintang
  drawStars();
}

void generateRandomStars() {
  // Perulangan for untuk memmbuat posisi bintang
  for (int i = 0; i < numStars; i++) {
    starX[i] = int(random(width));
    starY[i] = int(random(height));
  }
}

void drawStars() {
  // Perulangan for untuk menggambar bintang sesuai dengan posisi yang telah ditentukan
  for (int i = 0; i < numStars; i++) {
    float starSize = random(1, 6); // Ukuran random bintang
    fill(248, 244, 163); // Warna Kuning
    noStroke();
    ellipse(starX[i], starY[i], starSize, starSize); // Menggambar bintang dengan ukuran yang berubah
  }
}

void drawRoket() {
  
  // Push untuk awal objek roket yang ingin dipisah 
  pushMatrix(); // Simpan transformasi
  
  // Mengatur posisi roket agar berpindah berdasarkan roketMove
  translate(roketMove, 0);
  
  // (Gambar setelahnya akan digeser)
  
  // Antena
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(1);
  line(773, 436, 820, 436);
  stroke(0, 0, 0); // Warna Hitam
  strokeWeight(7);
  line(765, 436, 768, 436);
  
  // Kepala Roket
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(1);
  fill(255, 255, 255); // Warna Putih
  triangle(675, 397, 675, 473, 760, 436);
  
  // Ekor Roket
  fill(139, 139, 140); // Warna Abu
  stroke(139, 139, 140); // Warna Abu
  square(450, 408, 55);
  
  // Api Ekor
  stroke(222, 74, 68); // Warna Merah Jingga
  fill(222, 74, 68); // Warna Merah Jingga
  
  // Curve vertex untuk layer api pertama
  beginShape();
  curveVertex(428, 510);
  curveVertex(428, 410);
  curveVertex(330, 425);
  curveVertex(330, 445);
  curveVertex(428, 460);
  curveVertex(428, 370);
  endShape();
  
  stroke(228, 128, 56); // Warna Jingga
  fill(228, 128, 56); // Warna Jingga
  
  // Bezier curve untuk layer api kedua
  bezier(427, 413,  310, 425,  310, 445,  427, 456);
  
  stroke(253, 206, 64); // Warna Kuning
  fill(253, 206, 64); // Warna Kuning
  
  // Vertex untuk layer api ketiga
  beginShape();
  vertex(426, 450);
  vertex(355, 435);
  vertex(426, 420);
  endShape();
  
  // Badan Roket
  stroke(255, 255, 255); // Warna Putih
  fill(255, 255, 255); // Warna Putih
  rect(485, 395, 200, 80, 0, 20, 20, 0); 
  
  // Jendela Roket
  stroke(138, 138, 139); // Warna Abu
  strokeWeight(4);
  fill(187, 224, 242); // Warna Biru Muda
  circle(670, 435, 50);
  
  // Sayap Roket
  fill(17, 132, 174); // Warna Biru
  stroke(17, 132, 174); // Warna Biru
  quad(460, 330, 555, 360, 600, 393, 520, 393);
  quad(460, 540, 555, 510, 600, 478, 520, 478);
  strokeWeight(6);
  strokeCap(SQUARE);
  line(460, 435, 600, 435);
  
  // Pop untuk akhir objek roket yang ingin dipisah 
  popMatrix(); // Hapus transformasi
}

void drawPortal() {
  pushMatrix(); // Menyimpan transformasi awal
  
  ellipseMode(CENTER);
  translate(1150, 440); // Menggantikan titik x & y portal
  rotate(sudutPortal); // Rotasi perputaran portal berdasarkan sudutPortal yang terus bertambah
  
  fill(35, 51, 88); // Warna Abu Pudar
  ellipse(0, 0, portalWidth, 300);
  
  fill(0, 0, 0); // Warna Hitam
  ellipse(0, 0, portalWidth, 260);
  
  popMatrix(); // Mengembalikan transformasi ke kondisi sebelumnya
}

void drawBumi(){
  // Push untuk awal objek bumi yang ingin dipisah 
  pushMatrix(); // Simpan transformasi

  // Skala berdasarkan waktu
  scaleValueBumi = 0.9 + abs(sin(frameCount * 0.03)) * 0.1; // abs() berfungsi untuk mendapat nilai selalu +
  
  // Mengatur posisi bumi agar berpindah berdasarkan nilaiXBumi
  translate(nilaiXBumi, 0);
  
  // Push untuk awal objek atmosfir bumi yang ingin dipisah 
  
  pushMatrix(); // Simpan transformasi
  translate(130, 700); // Posisi x dan y objek atmosfir
  
  // Skala atmosfir yang berubah-ubah
  scale(scaleValueBumi); // Faktor skala
  stroke(35, 51, 88); // Warna Abu Pudar
  fill(35, 51, 88); // Warna Abu Pudar
  
  circle(0, 0, 530);
  // Pop untuk akhir objek atmosfir bumi yang ingin dipisah 
  popMatrix(); // Hapus transformasi
  
  // Bumi
  fill(91, 93, 123); // Warna Abu 
  circle(130, 700, 380);
  
  stroke(143, 142, 165); // Warna Abu
  strokeWeight(9);
  fill(6, 131, 177); // Warna Biru
  circle(130, 700, 340);
  
  strokeCap(ROUND);
  
  // Pulau 1
  stroke(180, 214, 97); // Warna Hijau
  strokeWeight(30);
  line(130, 666, 180, 666);
  strokeWeight(40);
  line(130, 700, 200, 700);
  // Awan Pulau 1
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(20);
  line(180, 700, 230, 700);
  line(210, 725, 230, 725);
  
  // Pulau 2 (Kecil)
  stroke(180, 214, 97); // Warna Hijau
  strokeWeight(30);
  line(50, 580, 90, 580);
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(20);
  line(70, 590, 110, 590);
  
  // Pulau 3 (Kecil)
  stroke(180, 214, 97); // Warna Hijau
  strokeWeight(30);
  line(180, 580, 220, 580);
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(20);
  line(160, 570, 200, 570);
  
  // Pulau 4
  stroke(180, 214, 97); // Warna Hijau
  strokeWeight(30);
  line(40, 720, 50, 720);
  strokeWeight(40);
  line(10, 750, 50, 750);
  // Awan Pulau 4
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(20);
  line(40, 730, 70, 730);
  
  // Pulau 5 (Kecil)
  stroke(180, 214, 97); // Warna Hijau
  strokeWeight(30);
  line(200, 760, 240, 760);
  
  // Awan 
  stroke(255, 255, 255); // Warna Putih
  line(5, 680, 40, 680);
  line(20, 665, 40, 665);
  line(260, 670, 276, 670);
  strokeWeight(30);
  line(240, 650, 270, 650);
  noStroke();
  
  // Pop untuk akhir objek bumi yang ingin dipisah 
  popMatrix(); // Hapus transformasi
}

void drawBulan(){
  // Push untuk awal objek bulan yang ingin dipisah 
  pushMatrix(); // Simpan transformasi
  
  // Mengatur posisi bulan agar berpindah berdasarkan nilaiXBulan
  translate(nilaiXBulan, 0);
  
  // Bulan
  stroke(231, 226, 207); // Warna Cream
  strokeWeight(1);
  fill(231, 226, 207); // Warna Cream
  circle(30, 320, 150);

  // Bintik Bulan
  stroke(218, 210, 191); // Warna Cream Gelap
  strokeWeight(1);
  fill(218, 210, 191); // Warna Cream Gelap
  circle(60, 320, 30);
  circle(30, 280, 20);
  circle(80, 280, 15);
  circle(20, 360, 40);
  circle(70, 360, 15);
  circle(10, 310, 15);
  noStroke();
  
  // Pop untuk akhir objek bulan yang ingin dipisah 
  popMatrix(); // Hapus transformasi
}

void drawMars(){
  // Push untuk awal objek mars yang ingin dipisah 
  pushMatrix(); // Simpan transformasi
  
  // Skala berdasarkan waktu
  scaleValueMars = 1.0 + abs(sin(frameCount * 0.03)) * 0.1; // abs() berfungsi untuk mendapat nilai selalu +
  
  // Mengatur posisi mars agar berpindah berdasarkan nilaiXMars
  translate(nilaiXMars, 0);
  
  // Mars
  pushMatrix(); // Simpan transformasi
  translate(1220, 157); // Posisi x dan y objek atmosfir
  
  // Skala atmosfir yang berubah-ubah
  scale(scaleValueMars); // Faktor skala
  stroke(35, 51, 88); // Warna Abu Pudar
  fill(35, 51, 88); // Warna Abu Pudar
  circle(0, 0, 310);
  
  // Pop untuk akhir objek atmosfir bumi yang ingin dipisah 
  popMatrix(); // Hapus transformasi
  
  stroke(226, 129, 50); // Warna Orange Gelap
  fill(226, 129, 50); // Warna Orange Gelap
  circle(1220, 157, 250);
  noStroke();
  
  // Pop untuk akhir objek mars yang ingin dipisah 
  popMatrix(); // Hapus transformasi
}

void drawNama(){
  // Nama
  textSize(30);
  fill(255, 255, 255);
  text("NIM     : 2109106002", 40, 60); 
  text("Nama : Alif Maulana Setyawan", 40, 100); 
}
