import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Delete,
  Put,
} from '@nestjs/common';
import { ProductsService } from './products.service';
import { Product } from './entities/product.entity';

@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Post()
  async create(
    @Body()
    newProduct: Product,
  ): Promise<Product> {
    return await this.productsService.CreateProduct(newProduct);
  }

  @Get()
  async findAll(): Promise<Product[]> {
    return await this.productsService.findProducts();
  }

  @Get(':idProduct')
  async findOne(
    @Param('idProduct')
    id: string,
  ) {
    return await this.productsService.findOneProduct(id);
  }

  @Put(':idProduct')
  async update(
    @Param('idProduct')
    id: string,
    @Body()
    updateProduct: Product,
  ): Promise<Product> {
    return await this.productsService.updateProduct(id, updateProduct);
  }

  @Delete(':idProduct')
  async remove(
    @Param('idProduct')
    id: string,
  ): Promise<boolean> {
    return await this.productsService.deleteProduct(id);
  }
}
