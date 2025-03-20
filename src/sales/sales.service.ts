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

  async createSale(newVenta: Sale): Promise<Sale> {
    return await this.saleRepository.save(newVenta);
  }

  async findSales(): Promise<Sale[]> {
    return await this.saleRepository.find();
  }

  async findOneSale(id: string): Promise<Sale> {
    const Sale = await this.saleRepository.findOne({ where: { idVenta: +id } });
    if (!Sale) {
      throw new Error(`Sale with id ${id} not found`);
    }
    return Sale;
  }

  async updateSale(id: string, updateSale: Sale): Promise<Sale> {
    await this.findOneSale(id);

    await this.saleRepository.update(id, updateSale);
    return await this.findOneSale(id);
  }

  async deleteSale(id: string) {
    await this.saleRepository.delete(id);
    return 'Sale deleted';
  }
}
