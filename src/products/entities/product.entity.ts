import { Sale } from 'src/sales/entities/sale.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'producto' })
export class Product {
  @PrimaryGeneratedColumn({ name: 'id_producto' })
  idProducto: number;

  @Column({ name: 'nom_producto' })
  nombreProducto: string;

  @Column()
  descripcion: string;

  @Column()
  precio: number;

  @Column({ name: 'is_oferta' })
  isOferta: boolean;

  @Column({ name: 'porcentaje_oferta', type: 'numeric' })
  porcentajeOferta: number;

  @Column({ name: 'precio_final' })
  precioFinal: number;

  @OneToMany(() => Sale, (sale) => sale.Producto)
  sales: Sale[];
}
