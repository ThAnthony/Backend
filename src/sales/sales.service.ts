import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Sale } from './entities/sale.entity';

@Injectable()
export class SalesService {
  constructor(
    @InjectRepository(Sale)
    private readonly saleRepository: Repository<Sale>,
  ) {}

  async createSale(newVenta: Sale[]): Promise<Sale[]> {
    return await this.saleRepository.save(newVenta);
  }

  async findSales(): Promise<Sale[]> {
    return await this.saleRepository.find({
      order: { idVenta: 'DESC' },
    });
  }

  async findSalesUser(idUser: string): Promise<Sale[]> {
    const sales = await this.saleRepository
      .createQueryBuilder('sale')
      .leftJoinAndSelect('sale.Usuario', 'usuario')
      .leftJoinAndSelect('sale.Producto', 'producto')
      .where('usuario.idUsuario = :idUser', { idUser })
      .orderBy('sale.idVenta', 'DESC')
      .getMany();
    if (sales.length === 0) {
      throw new Error(`Sales not found`);
    }
    return sales;
  }
}
