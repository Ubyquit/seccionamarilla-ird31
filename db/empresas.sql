CREATE TABLE estados (
    id_estado INT PRIMARY KEY,
    estado VARCHAR(255) NOT NULL
);

INSERT INTO estados (id_estado, estado) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Coahuila'),
(8, 'Colima'),
(9, 'Ciudad de México'),
(10, 'Durango'),
(11, 'Guanajuato'),
(12, 'Guerrero'),
(13, 'Hidalgo'),
(14, 'Jalisco'),
(15, 'México'),
(16, 'Michoacán'),
(17, 'Morelos'),
(18, 'Nayarit'),
(19, 'Nuevo León'),
(20, 'Oaxaca'),
(21, 'Puebla'),
(22, 'Querétaro'),
(23, 'Quintana Roo'),
(24, 'San Luis Potosí'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz'),
(31, 'Yucatán'),
(32, 'Zacatecas');

CREATE TABLE municipios(
    id_municipio INT PRIMARY KEY AUTO_INCREMENT,
    municipio VARCHAR(100),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES estados(id_estado)
);

CREATE TABLE ubicaciones(
    id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
    id_estado INT,
    id_municipio INT,
    ciudad VARCHAR(100),
    cp VARCHAR(5),
    sm VARCHAR(10),
    mzn VARCHAR(10),
    lote VARCHAR(10),
    numero_ext VARCHAR(10),
    numero_int VARCHAR(10),
    calle VARCHAR(100),
    referencia VARCHAR(500),
    map VARCHAR(500),
    FOREIGN KEY(id_estado) REFERENCES estados(id_estado),
    FOREIGN KEY(id_municipio) REFERENCES municipios(id_municipio)
);

CREATE TABLE redes_sociales(
    id_red_social INT PRIMARY KEY AUTO_INCREMENT,
    facebook VARCHAR(500),
    instagram VARCHAR(500),
    twitter VARCHAR(500),
    youtube VARCHAR(500),
    linkedin VARCHAR(500)
);

CREATE TABLE giros(
    id_giro INT PRIMARY KEY AUTO_INCREMENT,
    giro VARCHAR(50)
);

CREATE TABLE empresas(
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_giro INT,
    descripcion VARCHAR(500),
    correo VARCHAR(100),
    contrasena VARCHAR(100),
    telefono VARCHAR(10),
    whatsappn VARCHAR(10),
    web VARCHAR(100),
    id_ubicacion INT,
    id_red_social INT,
    FOREIGN KEY(id_giro) REFERENCES giros(id_giro),
    FOREIGN KEY(id_ubicacion) REFERENCES ubicaciones(id_ubicacion),
    FOREIGN KEY(id_red_social) REFERENCES redes_sociales(id_red_social)
    );

CREATE TABLE horarios(
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    dia VARCHAR(10),
    apertura TIME,
    cierre TIME,
    FOREIGN KEY(id_empresa) REFERENCES empresas(id_empresa)
);