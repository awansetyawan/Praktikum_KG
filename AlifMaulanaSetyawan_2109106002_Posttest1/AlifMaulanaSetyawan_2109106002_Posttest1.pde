int numStars = 40; // Jumlah Bintang
int[] starX = new int[numStars];
int[] starY = new int[numStars];

void setup(){
  size(1225, 765);
  smooth();
  background(13, 36, 77);
  generateRandomStars();
}

void draw(){
  // Bintang
  drawStars();
  
  strokeWeight(1);
  
  // Bumi
  stroke(35, 51, 88); // Warna Abu Pudar
  fill(35, 51, 88); // Warna Abu Pudar
  circle(130, 700, 530);
  
  fill(91, 93, 123); // Warna Abu 
  circle(130, 700, 380);
  
  stroke(143, 142, 165); // Warna Abu
  strokeWeight(9);
  fill(6, 131, 177); // Warna Abu 
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
  
  // Mars
  stroke(35, 51, 88); // Warna Abu Pudar
  fill(35, 51, 88); // Warna Abu Pudar
  circle(1220, 157, 310);
  stroke(226, 129, 50); // Warna Orange Gelap
  fill(226, 129, 50); // Warna Orange Gelap
  circle(1220, 157, 250);
  
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
  triangle(430, 410, 430, 460, 350, 436);
  
  stroke(228, 128, 56); // Warna Jingga
  fill(228, 128, 56); // Warna Jingga
  triangle(423, 420, 423, 450, 365, 436);
  
  stroke(253, 206, 64); // Warna Kuning
  fill(253, 206, 64); // Warna Kuning
  triangle(415, 427, 415, 444, 380, 436);
  
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
  
  // Nama
  textSize(30);
  fill(255, 255, 255);
  text("NIM     : 2109106002", 40, 60); 
  text("Nama : Alif Maulana Setyawan", 40, 100); 
}

void generateRandomStars() {
  for (int i = 0; i < numStars; i++) {
    starX[i] = int(random(width));
    starY[i] = int(random(height));
  }
}

void drawStars() {
  fill(248, 244, 163); // Warna Kuning
  noStroke(); // Tidak ada garis di bintang

  for (int i = 0; i < numStars; i++) {
    ellipse(starX[i], starY[i], 5, 5); // Membuat Bintang Dengan Ellips
  }
}
