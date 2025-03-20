import { Sale } from 'src/sales/entities/sale.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'usuario' })
export class Usuario {
  @PrimaryGeneratedColumn({ name: 'id_usuario' })
  idUsuario: number;

  @Column({ name: 'nom_persona' })
  nombrePersona: string;

  @Column()
  username: string;

  @Column()
  password: string;

  @Column()
  rol: string;

  @OneToMany(() => Sale, (sale) => sale.Usuario)
  sales: Sale[];
}
