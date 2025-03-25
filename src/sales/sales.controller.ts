import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { SalesService } from './sales.service';
import { Sale } from './entities/sale.entity';

@Controller('sales')
export class SalesController {
  constructor(private readonly salesService: SalesService) {}

  @Post()
  async create(
    @Body()
    newSale: Sale,
  ) {
    return await this.salesService.createSale(newSale);
  }

  @Get()
  async findAll() {
    return await this.salesService.findSales();
  }

  @Get(':idUsuario')
  async findOne(
    @Param('idUsuario')
    id: string,
  ) {
    return await this.salesService.findSalesUser(id);
  }
}
