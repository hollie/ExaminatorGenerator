use utf8;
package ExaminatorCreatorDb::Result::Verdelingen;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExaminatorCreatorDb::Result::Verdelingen

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<verdelingen>

=cut

__PACKAGE__->table("verdelingen");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 categorie_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 dienst_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 aantal

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "categorie_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "dienst_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "aantal",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 categorie

Type: belongs_to

Related object: L<ExaminatorCreatorDb::Result::Categorien>

=cut

__PACKAGE__->belongs_to(
  "categorie",
  "ExaminatorCreatorDb::Result::Categorien",
  { id => "categorie_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 dienst

Type: belongs_to

Related object: L<ExaminatorCreatorDb::Result::Diensten>

=cut

__PACKAGE__->belongs_to(
  "dienst",
  "ExaminatorCreatorDb::Result::Diensten",
  { id => "dienst_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-05-13 06:42:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eKkNCnah0tCPFFjzf0nJpw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
