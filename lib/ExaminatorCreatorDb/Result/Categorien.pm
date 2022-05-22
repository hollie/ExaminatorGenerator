use utf8;
package ExaminatorCreatorDb::Result::Categorien;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExaminatorCreatorDb::Result::Categorien

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<categorien>

=cut

__PACKAGE__->table("categorien");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 naam

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "naam",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 verdelingens

Type: has_many

Related object: L<ExaminatorCreatorDb::Result::Verdelingen>

=cut

__PACKAGE__->has_many(
  "verdelingens",
  "ExaminatorCreatorDb::Result::Verdelingen",
  { "foreign.categorie_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vragens

Type: has_many

Related object: L<ExaminatorCreatorDb::Result::Vragen>

=cut

__PACKAGE__->has_many(
  "vragens",
  "ExaminatorCreatorDb::Result::Vragen",
  { "foreign.categorie_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-05-13 06:42:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q2K1qwKSsBQrHt8MMWGZZw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
