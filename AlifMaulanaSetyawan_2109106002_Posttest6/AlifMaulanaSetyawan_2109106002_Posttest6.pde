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
  size(1225, 765, P3D); // Canvas 3D
  
  smooth(); // Memperhalus tepi gambar 
  
  frameRate(60); // Nilai frame
  
  generateRandomStars(); // Memanggil fungsi membuat bintang
  
  hint(DISABLE_OPTIMIZED_STROKE); // Membuat anti aliasing
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
  drawRoket(0, 434.5, 600 + roketMove, 40, 220, 20, 40.7, 220);
  
  // Menggambar komponen tambahan roket
  drawComponentRocket();
  
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
  if (roketMove >= 300 || portalWidth >= 110) {
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
  
  noStroke();
  
  // Pulau 1
  fill(180, 214, 97); // Warna Hijau
  rect(117, 655, 80, 30, 100);
  rect(109, 685, 110, 35, 100);
  
  // Awan Pulau 1
  fill(255, 255, 255); // Warna Putih
  rect(180, 695, 55, 15, 100);
  rect(200, 715, 35, 15, 100);
  
  // Pulau 2 (Kecil)
  fill(180, 214, 97); // Warna Hijau
  rect(40, 565, 65, 25, 100);
  fill(255, 255, 255); // Warna Putih
  rect(68, 578, 50, 20, 100);
  
  // Pulau 3 (Kecil)
  fill(180, 214, 97); // Warna Hijau
  rect(170, 570, 65, 25, 100);
  fill(255, 255, 255); // Warna Putih
  rect(150, 560, 50, 20, 100);
  
  // Pulau 4
  fill(180, 214, 97); // Warna Hijau
  rect(10, 710, 48, 25, 100);
  rect(-10, 733, 70, 35, 100);
  
  // Awan Pulau 4
  fill(255, 255, 255); // Warna Putih
  rect(20, 725, 50, 18, 100);
  
  // Pulau 5 (Kecil)
  fill(180, 214, 97); // Warna Hijau
  rect(185, 745, 65, 25, 100);
  
  // Awan 
  fill(255, 255, 255); // Warna Putih
  rect(-10, 640, 55, 25, 100);
  rect(5, 660, 45, 25, 100);
  rect(226, 635, 55, 25, 100);
  rect(253, 655, 35, 25, 100);
  
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

void drawRoket(float x, float y, float z, float cylinderRadius, float cylinderHeight, int segments, float coneRadius, float coneHeight) {
  
  lights(); // Ray Tracing untuk body roket
    
  float angleIncrement = TWO_PI / segments;
  
  pushMatrix();
  
  rotateY(HALF_PI);
  
  translate(x, y, z);
  
  fill(255, 255, 255); // Warna Putih

  // Menggambar tubuh roket
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= segments; i++) {
    float angle = i * angleIncrement;
    float x1 = cylinderRadius * cos(angle);
    float y1 = cylinderRadius * sin(angle);
    vertex(x1, y1, cylinderHeight / 2);
    vertex(x1, y1, -cylinderHeight / 2);
  }
  endShape();
  
  // Menggambar penutup bawah roket
  beginShape(TRIANGLE_FAN);
  for (int i = 0; i <= segments; i++) {
    float angle = i * angleIncrement;
    float xTop = cylinderRadius * cos(angle);
    float yTop = cylinderRadius * sin(angle);
    vertex(xTop, yTop, -cylinderHeight / 2);
  }
  endShape(CLOSE);
  
  // Menggambabr kepala roket
  beginShape(TRIANGLE_FAN);
  vertex(0, 0, cylinderHeight);
  for (float angle = 0; angle <= TWO_PI + angleIncrement; angle += angleIncrement) {
    float coneX = coneRadius * cos(angle);
    float coneY = coneRadius * sin(angle);
    vertex(coneX, coneY, -coneHeight / 2 + cylinderHeight);
  }
  endShape(CLOSE);
  
  // Menghitung peletakan kotak
  float boxSize = cylinderRadius-11;
  translate(0, 0, -cylinderHeight / 2 - boxSize / 2);
  box(boxSize); // Kotak
  
  // Ray Tracing poinLight
  pointLight(150, 100, 0, 200 - roketMove, 150 - roketMove, 50);
  pointLight(0, 102, 255, -200 - roketMove, -150 - roketMove, 50);
  
  // Jendela Roket
  fill(187, 224, 242); // Warna Biru Muda
  translate(-35, 0, 200);
  sphere(23);
  
  popMatrix();
  
}

void drawComponentRocket(){
  noLights(); // Menghilangkan efek ray tracing pada komponen roket
  
  pushMatrix();
  
  translate(roketMove, 0);

  // Antena
  stroke(255, 255, 255); // Warna Putih
  strokeWeight(1);
  line(827, 434.5, 855, 434.5);
  stroke(0, 0, 0); // Warna Hitam
  strokeWeight(8);
  line(820, 434.5, 825, 434.5);
  
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
  
  // Sayap Roket
  fill(17, 132, 174); // Warna Biru
  stroke(17, 132, 174); // Warna Biru
  quad(460, 330, 555, 360, 600, 397, 520, 397);
  quad(460, 540, 555, 510, 600, 473, 520, 473);
  strokeWeight(6);
  strokeCap(SQUARE);
  //line(460, 435, 600, 435);
  line(460, 435, 40, 600, 435, 40);
  line(460, 435, -40, 600, 435, -40);
  
  popMatrix(); 
}
