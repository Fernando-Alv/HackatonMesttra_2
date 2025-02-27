drop database api;
create database api;
use api;

CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `preco_unitario` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `data_compra` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_id_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `item_pedido` (
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `qtde` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_id_idx` (`id_pedido`),
  KEY `fk_produto_id_idx` (`id_produto`),
  CONSTRAINT `fk_pedido_id` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_produto_id` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO `produto` VALUES (1,'Sabão em pó 1KG',5.2),(2,'Sabão Líquido Neutro',1.2),(3,'Arroz 1KG',4.8),(4,'Arroz 5KG',20.1),(5,'Coca-Cola 1LT',12);
INSERT INTO `usuario` VALUES (1,'Rogerio de Freitas Ribeiro','rogeriofr@gmail.com '),(2,'Maria da Silva','maria@gmail.com');
INSERT INTO `pedido` VALUES (3,1,'2025-01-30 15:20:12'),(4,2,'2025-02-02 10:00:00');
INSERT INTO `item_pedido` VALUES (3,1,1,1),(3,4,2,2),(3,2,5,3),(4,5,1,4),(4,1,2,5),(4,2,1,6);