import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Delete,
  Put,
} from '@nestjs/common';
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

  @Get(':idSale')
  async findOne(
    @Param('idSale')
    id: string,
  ) {
    return await this.salesService.findOneSale(id);
  }

  @Put(':idSale')
  async update(
    @Param('idSale')
    id: string,
    @Body()
    updateSale: Sale,
  ) {
    return await this.salesService.updateSale(id, updateSale);
  }

  @Delete(':idSale')
  async remove(
    @Param('idSale')
    id: string,
  ) {
    return await this.salesService.deleteSale(id);
  }
}
