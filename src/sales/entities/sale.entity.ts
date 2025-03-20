import { Usuario } from 'src/login/entities/Usuario.entity';
import { Product } from 'src/products/entities/product.entity';
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity({ name: 'venta' })
export class Sale {
  @PrimaryGeneratedColumn({ name: 'id_venta' })
  idVenta: number;

  @ManyToOne(() => Product, (product) => product.sales, {
    eager: true,
  })
  @JoinColumn({ name: 'id_producto', referencedColumnName: 'idProducto' })
  Producto: Product;

  @ManyToOne(() => Usuario, (login) => login.sales, {
    eager: true,
  })
  @JoinColumn({ name: 'id_usuario', referencedColumnName: 'idUsuario' })
  Usuario: Usuario;

  @Column({ name: 'monto_final' })
  montoFinal: number;

  @Column({ name: 'fecha_venta' })
  fechaVenta: Date;
}
